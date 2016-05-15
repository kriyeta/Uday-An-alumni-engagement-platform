class HomePageController < ApplicationController
  before_action :authenticate_user!, :except => [:home]

  def home
    @events = Event.where('event_date > ?', DateTime.now).order("event_date ASC").limit(3)
    @agendas = Agenda.all.order("updated_at DESC").limit(3)
  end
end
