class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find_by_hash(params[:hash])
    
    raise ActiveRecord::RecordNotFound unless @schedule
  end

  def new
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(params[:schedule])

    if @schedule.save
      @schedule.generate_hash!
      redirect_to schedule_path(@schedule.hash), :notice => 'Schedule was successfully created.'
    else
      render :action => "new"
    end
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
