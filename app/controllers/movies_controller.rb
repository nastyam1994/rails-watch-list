class MoviesController < ApplicationController
  before_action :set_movie, only: :create
  
  #GET lists/:id
  def show
    @movie = Movie.new
  end

  private
  
  def set_movie
    @list = List.find(params[:list_id])
  end
end
  