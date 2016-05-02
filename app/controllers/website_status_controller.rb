class WebsiteStatusController < ApplicationController

  skip_before_action :authenticate_user!
  layout "website_status", :except => :page_under_construction
  layout "application", :only => :page_under_construction
  def under_construction
  end

  def page_under_construction
  end

  def under_maintenance
  end
end
