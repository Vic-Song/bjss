class SearchController < ApplicationController
  def index
  	@courses = Course.search(params[:search_text])
  end
end
