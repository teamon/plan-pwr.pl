# encoding: utf-8

class EntriesController < ApplicationController
  before_filter :fetch_schedule

  def new
    @entry = @schedule.entries.new
    render :layout => !request.xhr?
  end
  
  def create
    @entry = @schedule.entries.new(params[:entry])
    
    p @entry.save
    if @entry.save
      render :json => { :notice => "Kurs pomyślnie zapisany" }
    else
      render :json => @entry.errors, :status => :unprocessable_entity
    end
  end

  def edit
    @entry = @schedule.entries.find(params[:id])
    render :layout => !request.xhr?
  end
  
  def update
    @entry = @schedule.entries.find(params[:id])
  
    if @entry.update_attributes(params[:entry])
      render :json => { :notice => "Kurs pomyślnie zapisany" }
    else
      render :json => @entry.errors, :status => :unprocessable_entity
    end
  end
  
  protected
  
  def fetch_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  # def create
  #   schedule, entries = Plan::Parser.parse!(params[:raw])
  #   
  #   if schedule.save
  #     schedule.generate_hash!
  #     
  #     entries.each do |e| 
  #       e.schedule = schedule
  #       e.save
  #     end
  #     
  #     redirect_to schedule_path(schedule.hash), :notice => 'Schedule was successfully created.'
  #   else
  #     render :action => "new"
  #   end
  # end
  



  # # DELETE /schedules/1
  # # DELETE /schedules/1.xml
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
