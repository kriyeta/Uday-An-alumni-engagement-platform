class MeetsOrEventsController < ApplicationController
  def upcoming_events
    @events = Event.where('event_date > ?', DateTime.now).order("event_date ASC").limit(10)
  end

  def all_events
  end

  def agendas
  end
end
