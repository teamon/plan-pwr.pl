# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  def info
    render :info, :layout => "static"
  end
end
