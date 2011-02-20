# encoding: utf-8

class ColorSchemesController < ApplicationController
  before_filter :fetch_schedule
  
  def index
    @schemes = @schedule.color_schemes
    render :layout => false
  end
  
  def update
    if @schedule.update_attributes(params[:schedule])
      render :json => { :notice => "Ustawienia pomyślnie zapisane" }
    else
      render :json => @entry.errors, :status => :unprocessable_entity
    end
  end
  
  def reset
    @schedule.reset_color_schemes!
    render :json => { :notice => "Przywrócono ustawienia domyślne" }
  end

  protected
  
  def fetch_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
