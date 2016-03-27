class SearchController < ApplicationController
  def search
    search_query = params[:alumni_search_query]
    @formUser = FormUser.quick_search(search_query)
  end
end
