class Admin::EventsController < ApplicationController
  before_action :authorize_user_as_admin!
  layout "admin"

  def index
    search_query = params[:query]
    if search_query.blank?
      @events = Event.all.order("event_date DESC").limit(100).page(params[:page]).per_page(10)
    else
      @events = Event.quick_search(search_query).order("event_date DESC").limit(100).page(params[:page]).per_page(10)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to [:admin, @event], :notice => "Successfully created event." and return
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
      redirect_to [:admin, @event], :notice => "Successfully updated event." and return
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_url, :notice => "Successfully destroyed event."
  end

  private

  def event_params
    params.require(:event).permit!.except(:id)
    # If you want to permit few columns explicitly
    # params.require(:event).permit(:title, :summary, :status, :event_type, :target_audiance)
  end
end
