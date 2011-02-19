class SchedulesController < ApplicationController
  respond_to :html, :pdf
  
  def show
    @schedule = Schedule.find_by_slug(params[:slug])
    raise ActiveRecord::RecordNotFound unless @schedule
    
    if request.xhr?
      @generator = Plan::Generators::HTML.new(@schedule)
      render :partial => "schedule", :layout => false
    else
      if params[:format]
        respond_with(@schedule) do |format|
          format.html do
            @generator = Plan::Generators::HTML.new(@schedule)
            @schedule_css = File.read(File.join(Rails.root, "public/stylesheets/schedule.css"))
            render "export", :layout => "export"
          end
          
          format.pdf do
            @generator = Plan::Generators::HTML.new(@schedule)
            @schedule_css = File.read(File.join(Rails.root, "public/stylesheets/schedule.css"))
            html = render_to_string "export.html", :layout => "export.html"
            
            pdf = Plan::Generators::PDF.new.generate(html)
            send_data pdf, :filename => "plan.pdf", 
                           :type => "application/pdf", 
                           :disposition => "inline"
          end
        end
      else
        @generator = Plan::Generators::HTML.new(@schedule)
      end
    end
  end

  def new
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Plan::Parser.parse!(params[:raw])
    
    if @schedule.save
      redirect_to schedule_path(@schedule.slug), :notice => 'Schedule was successfully created.'
    else
      render :action => "new"
    end
  rescue
    render :actions => "new"
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to(@schedule, :notice => 'Schedule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @schedule = Schedule.find(params[:id])
  #   @schedule.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(schedules_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
