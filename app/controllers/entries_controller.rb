# encoding: utf-8

class EntriesController < ApplicationController
  before_filter :fetch_schedule

  def new
    @entry = @schedule.entries.new
    render :layout => !request.xhr?
  end

  def create
    @entry = @schedule.entries.new(entry_params)

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

    if @entry.update_attributes(entry_params)
      render :json => { :notice => "Kurs pomyślnie zapisany" }
    else
      render :json => @entry.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @entry = @schedule.entries.find(params[:id])
    @entry.destroy
    render :json => { :notice => "Kurs usunięty" }
  end

  def search_course_names
    render :json => Entry.search(params[:term], :course_name)
  end

  def search_lecturers
    render :json => Entry.search(params[:term], :lecturer)
  end

  protected

  def fetch_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def entry_params
    params.require(:entry).permit(
      :course_code, :course_name, :course_type, :group_code,
      :week, :week_day, :building, :room, :lecturer,
      :start_hour, :start_min, :end_hour, :end_min
    )
end

end
