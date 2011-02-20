# encoding: utf-8

class EntriesController < ApplicationController
  before_filter :fetch_schedule

  def new
    @entry = @schedule.entries.new
    render :layout => !request.xhr?
  end
  
  def create
    @entry = @schedule.entries.new(params[:entry])

    if @entry.save
      path = params[:commit] == "Zapisz" ? edit_schedule_entry_path(@schedule, @entry) : new_schedule_entry_path(@schedule)
      render :json => { :notice => "Kurs pomyślnie zapisany", :path => path }
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
  
  def show
    @entry = @schedule.entries.find(params[:id])
    render :partial => "entry", :locals => {:entry => @entry}
  end
  
  def destroy
    @entry = @schedule.entries.find(params[:id])
    @entry.destroy
    render :json => { :notice => "Kurs usunięty" }
  end
  
  def search_lecturers
    render :json => Entry.search_lecturers(params[:term])
  end
  
  protected
  
  def fetch_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
