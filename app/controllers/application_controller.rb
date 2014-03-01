# encoding: utf-8

require File.join(Rails.root, "lib", "epure", "avg")
require File.join(Rails.root, "lib", "epure", "parser")

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
    akz_cache = File.join(Epure.cache_root + "/akz.html")
    if not File.exists?(akz_cache) or (File.exists?(akz_cache) and (Time.now - File.mtime(akz_cache)) / 60 > 10) and not File.exists?(akz_cache + ".lock")
      File.open(akz_cache + ".lock", "w") {}
      url = "http://akz.pwr.wroc.pl/katalog_zap.html"
      html = Net::HTTP.get_response(URI.parse(url).host, URI.parse(url).path).body.force_encoding("UTF-8").encode!('UTF-8', 'UTF-8', :invalid => :replace)
      html = html.gsub(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/i, '').gsub(/<link\b[^<]*\/>/i, '').gsub(/src=".*?"/i, '')
      File.open(akz_cache, "w:UTF-8") { |file| file.write(html) }
      File.delete(akz_cache + ".lock")
    end
    @akz = File.read(akz_cache)
    render :layout => false
  end

  def akz
    @schedule = Schedule.new
    @generator = Epure::Generators::HTML.new(@schedule)
    render :layout => false
  end
end
