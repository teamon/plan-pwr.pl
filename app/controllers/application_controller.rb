# encoding: utf-8

require File.join(Rails.root, "lib", "epure", "avg")

class ApplicationController < ActionController::Base
  protect_from_forgery except: :avg

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
end
