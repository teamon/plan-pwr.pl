class SchedulesController < ApplicationController
  respond_to :html #, :pdf
  
  def show
    @schedule = Schedule.find_by_hash(params[:hash])
    
    raise ActiveRecord::RecordNotFound unless @schedule
    if params[:format]
      respond_with(@schedule) do |format|
        format.html do
          render :text => Plan::Generators::HTML.generate!(@schedule)
        end
      end
    else
      
    end
  end

  def new
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    schedule, entries = Plan::Parser.parse!(params[:raw])
    
    if schedule.save
      schedule.generate_hash!
      
      entries.each do |e| 
        e.schedule = schedule
        e.save
      end
      
      redirect_to schedule_path(schedule.hash), :notice => 'Schedule was successfully created.'
    else
      render :action => "new"
    end
  end
  
  def generate
    @schedule = Schedule.find(params[:id])
    
    render :text => Plan::Generators::HTML.generate!(@schedule)
  end

  # PUT /schedules/1
  # PUT /schedules/1.xml
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

  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to(schedules_url) }
      format.xml  { head :ok }
    end
  end
end
