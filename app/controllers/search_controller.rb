class SearchController < ApplicationController
  def index
    @members = Member.find_by_state(state: params[:search])
  end
end
