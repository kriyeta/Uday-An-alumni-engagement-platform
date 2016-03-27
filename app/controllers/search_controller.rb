class SearchController < ApplicationController
  def search
    search_query = params[:alumni_search_query]
    @form_users = FormUser.quick_search(search_query).page(params[:page]).per_page(10)
  end
  def search_profile
  end
end
