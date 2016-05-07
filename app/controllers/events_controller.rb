class EventsController < ApplicationController
  before_action :authorize_user_as_admin!
  layout "admin"

  def index
    search_query = params[:searchinput]
    puts search_query.to_s.red
    puts params
    puts "hello".red
    if search_query.nil?
      @events = Event.all.page(params[:page]).per_page(10)
    else
      @events = Event.quick_search(search_query).page(params[:page]).per_page(10)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event, :notice => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, :notice => "Successfully destroyed event."
  end

  private

  def event_params
    params.require(:event).permit(:title, :summary, :status, :type, :target_audiance, :organizers, :guests, :event_date, :event_from_time, :event_to_time, :venue, :image_path, :details)
  end
end
