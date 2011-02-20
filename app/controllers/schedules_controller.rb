# encoding: utf-8

class SchedulesController < ApplicationController
  respond_to :html, :pdf, :js, :xml
  
  def index
    @schedules = Schedule.all
  end
  
  def show
    @schedule = Schedule.find_by_slug(params[:slug])
    raise ActiveRecord::RecordNotFound unless @schedule
    
    if request.xhr?
      @generator = Plan::Generators::HTML.new(@schedule)
      render :partial => "schedule", :layout => false
    else
      if params[:format]
        respond_with(@schedule) do |format|
          format.html do
            html = render_html(@schedule, params[:mini])
            send_data html, :filename => "plan.html", 
                            :type => "text/html", 
                            :disposition => "inline"
          end
          
          format.pdf do
            orient = params[:mini] ? "portrait" : "landscape"
            html = render_html(@schedule, params[:mini])
            pdf = Plan::Generators::PDF.new.generate(html, :orientation => orient)
            send_data pdf, :filename => "plan.pdf", 
                           :type => "application/pdf", 
                           :disposition => "inline"
          end
          
          format.js do
            render :json => @schedule
          end
          
          format.xml do
            render :xml => @schedule
          end
        end
      else
        @generator = Plan::Generators::HTML.new(@schedule)
      end
    end
  end
  
  def render_html(schedule, mini = false)
    @generator = Plan::Generators::HTML.new(schedule)
    @schedule_css = File.read(File.join(Rails.root, "public/stylesheets/schedule.css"))
    render_to_string "exports/#{mini ? "mini" : "normal"}.html", :layout => false
  end

  def new
    @schedule = Schedule.new
    render :layout => !request.xhr?
  end

  # def edit
  #   @schedule = Schedule.find(params[:id])
  # end

  def create
    @schedule = params[:empty] ? Schedule.new : Plan::Parser.parse!(params[:schedule][:raw])
    
    if @schedule.save
      render :json => { :path => schedule_slug_path(@schedule.slug) }
    else
      render "new"
    end
  rescue
    render "new"
  end

  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(params[:schedule])
      render :json => { :notice => "Ustawienia pomyślnie zapisane" }
    else
      render :json => @schedule.errors, :status => :unprocessable_entity
    end
  end


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
