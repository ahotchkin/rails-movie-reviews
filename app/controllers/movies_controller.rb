class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort { |a, b| a.title <=> b.title }
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end


end
