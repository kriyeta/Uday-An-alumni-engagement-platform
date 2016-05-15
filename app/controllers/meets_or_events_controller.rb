class MeetsOrEventsController < ApplicationController
  def upcoming_events
    @events = Event.where('event_date > ?', DateTime.now).order("event_date ASC").limit(10)
  end

  def all_events
    search_query = params[:query]
    if search_query.blank?
      @events = Event.all.order("event_date DESC").limit(100).page(params[:page]).per_page(6)
    else
      @events = Event.quick_search(search_query).order("event_date DESC").limit(100).page(params[:page]).per_page(6)
    end
  end

  def agendas
    search_query = params[:query]
    if search_query.blank?
      @agendas = Agenda.all.order("updated_at DESC").limit(100).page(params[:page]).per_page(4)
    else
      @agendas = Agenda.quick_search(search_query).order("updated_at DESC").limit(100).page(params[:page]).per_page(4)
    end
  end
end
