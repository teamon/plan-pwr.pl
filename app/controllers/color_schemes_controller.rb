# encoding: utf-8

class ColorSchemesController < ApplicationController
  before_filter :fetch_schedule
  
  def index
    @schemes = @schedule.color_schemes
    render :layout => false
  end
  
  def reset
    @schedule.reset_color_schemes!
    render :json => { :notice => "Przywrócono ustawienia domyślne" }
  end
  
  def bw
    @schedule.bw_color_schemes!
    render :json => { :notice => "Ustawiono motyw czarno-biały" }
  end

  protected
  
  def fetch_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
