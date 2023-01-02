class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors_ordered = @movie.actors.order(:age)
  end

  def update
    MovieActor.create!(movie_id: params[:id], actor_id: params[:actor_id])
    redirect_to "/movies/#{params[:id]}"
  end
end