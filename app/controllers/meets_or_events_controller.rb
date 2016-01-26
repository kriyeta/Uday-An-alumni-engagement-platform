class MeetsOrEventsController < ApplicationController
  before_action :authenticate_user!
  def upcoming_events
  end

  def all_events
  end

  def agendas
  end
end
