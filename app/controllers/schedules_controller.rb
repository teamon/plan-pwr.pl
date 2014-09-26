class SchedulesController < ApplicationController
  respond_to :html, :htmlmini, :pdf, :pdfmini, :js, :xml, :ics, :vcs

  def index
  end

  def show
    @schedule = Schedule.find_by_slug(params[:slug])
    raise ActiveRecord::RecordNotFound unless @schedule

    if request.xhr?
      @generator = Epure::Generators::HTML.new(@schedule)
      render :partial => "schedule", :layout => false
    else
      if params[:format]
        respond_with(@schedule) do |format|
          format.html do
            html = cached(@schedule, "html") do
              render_html(@schedule, false)
            end

            send_data html, :filename => "plan.html",
                            :type => "text/html",
                            :disposition => "inline"
          end

          format.htmlmini do
            html = cached(@schedule, "htmlmini") do
              render_html(@schedule, true)
            end

            send_data html, :filename => "plan_mini.html",
                            :type => "text/html",
                            :disposition => "inline"
          end

          format.pdf do
            pdf = cached(@schedule, "pdf") do
              html = render_html(@schedule, false)
              Epure::Generators::PDF.new.generate(html, :orientation => "landscape")
            end

            send_data pdf, :filename => "plan.pdf",
                           :type => "application/pdf",
                           :disposition => "inline"
          end

          format.pdfmini do
            pdf = cached(@schedule, "pdfmini") do
              html = render_html(@schedule, true)
              Epure::Generators::PDF.new.generate(html, :orientation => "portrait")
            end

            send_data pdf, :filename => "plan_mini.pdf",
                           :type => "application/pdf",
                           :disposition => "inline"
          end

          format.ics do
            if params.has_key?(:zip)
              zip = cached(@schedule, "ics.zip") do
                Epure::Generators::ICS.new(@schedule).generate(true)
              end

              send_data zip,  :filename => "plan.zip",
                              :type => "application/octet-stream"
            else
              ics = cached(@schedule, "ics") do
                Epure::Generators::ICS.new(@schedule).generate
              end

              send_data ics,  :filename => "plan.ics",
                              :type => "text/icalendar"
            end
          end

          format.vcs do
            vcs = cached(@schedule, "vcs") do
              Epure::Generators::VCS.new(@schedule).generate
            end

            send_data vcs,  :filename => "plan.vcs",
                            :type => "text/X-vCalendar",
                            :disposition => "inline"
          end

          format.js do
            render :json => @schedule
          end

          format.xml do
            render :xml => @schedule
          end
        end
      else
        @generator = Epure::Generators::HTML.new(@schedule)
      end
    end
  end

  def new
    @schedule = Schedule.new
    render :layout => !request.xhr?
  end

  def edit
    @schedule = Schedule.find(params[:id])
    render :layout => !request.xhr?
  end

  def create
    @schedule = if params[:empty]
      Schedule.new
    elsif params[:commit] == "Pobierz plan"
      Epure::Automate.run!(params[:login], params[:password])
    else
      Epure::Parser.parse!(params[:schedule][:raw])
    end

    if @schedule.save
      render :json => { :path => schedule_slug_path(@schedule.slug) }
    else
      render :json => @schedule.errors, :status => :unprocessable_entity
    end
  rescue Epure::LoginException
    render :json => { :errors => ["Podane hasło jest niepoprawne"] }, :status => :unprocessable_entity
  rescue Epure::ParserException => ex
    params[:parser_input] = ex.data
    Raven.capture_exception(ex)
    if params[:commit] == "Pobierz plan"
      render :json => { :errors => ["Wystąpił błąd. Administrator został o nim poinformowany. Możesz sie z nim skontaktować poprzez email: i@teamon.eu"] }, :status => :unprocessable_entity
    else
      msg = if params[:schedule][:raw].to_s["Zapisy - grupy zajęciowe, do których zapisał się słuchacz w zapisach"]
        <<-EOS
        Podane źródło pochodzi ze strony <strong>"Zapisy - grupy zajęciowe, do których zapisał się słuchacz w zapisach", </strong></br>
        wymanage źródło musi być ze stronie <strong>"Grupy zajęciowe, do których słuchacz jest zapisany w semestrze".</strong><br/>
        (<a href='http://plan-pwr.pl/images/howto/3.jpg'>Jak trafic na poprawną stronę?</a>)<br/>
        Zajrzyj do instrukcji lub skontaktuj się z administratorem (i@teamon.eu).
        EOS
      else
        "Błędne źródło strony. Zajrzyj do instrukcji lub skontaktuj się z administratorem (i@teamon.eu)."
      end

      render :json => { :errors => [msg] }, :status => :unprocessable_entity
    end
  end


  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      render :json => {
        :notice => "Ustawienia pomyślnie zapisane",
        :year => @schedule.year,
        :semester => @schedule.semester_name
      }
    else
      render :json => @schedule.errors, :status => :unprocessable_entity
    end
  end

  protected

  def schedule_params
    params.require(:schedule).permit(:year, :semester,
      :color_schemes_attributes => [:background, :border, :font, :id])
  end

  def render_html(schedule, mini = false)
    @generator = Epure::Generators::HTML.new(schedule)
    @schedule_css = File.read(File.join(Rails.root, "app/assets/stylesheets/schedule.css"))
    render_to_string "exports/#{mini ? "mini" : "normal"}.html", :layout => false
  end

  def cached(schedule, format, &block)
    cache_key = "schedule:#{schedule.slug}:#{format}"

    Rails.cache.fetch(cache_key, raw: true, &block)
  end
end
