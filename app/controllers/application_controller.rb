class ApplicationController < ActionController::Base
  protect_from_forgery

  def info
    render :info, :layout => "static"
  end

  def avg
    begin
      if params[:data]
        @avg = Epure::Avg.parse!(params[:data])
      end
    rescue Exception => e
      redirect_to "/srednia"
    end
  end

  def akz_catalogue
    akz = Rails.cache.fetch("akz", raw: true, expires_in: 10.minutes) do
      response = Faraday.get("http://akz.pwr.wroc.pl/katalog_zap.html")
      response.body.gsub(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/i, '')
                  .gsub(/<link\b[^<]*\/>/i, '')
                  .gsub(/src=".*?"/i, '')
    end

    render text: akz
  end

  def akz
    @schedule = Schedule.new
    @generator = Epure::Generators::HTML.new(@schedule)
    render :layout => false
  end
end
