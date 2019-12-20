class SearchController < ApplicationController

  def index
    @facade = StationFacade.new(params[:location])
  end
end