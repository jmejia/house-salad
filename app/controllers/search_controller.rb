class SearchController < ApplicationController
  def index
    @members = Member.find_all(location: params[:search])
  end
end
