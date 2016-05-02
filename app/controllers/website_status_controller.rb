class WebsiteStatusController < ApplicationController

  skip_before_action :authenticate_user!
  def under_construction
  end

  def page_under_construction
  end

  def under_maintenance
  end
end
