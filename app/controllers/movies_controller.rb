class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors_ordered = @movie.actors.order(:age)
  end
end