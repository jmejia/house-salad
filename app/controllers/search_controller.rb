class SearchController < ApplicationController
  def index
    @members = Member.find_by_state(state: params[:search])
    binding.pry
  end
end
