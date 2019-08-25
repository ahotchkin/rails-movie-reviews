class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort { |a, b| a.title <=> b.title }
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
  end

  def create
    # redirect_if_not_admin
    movie = current_user.movies.build(movie_params)
    # raise params.inspect
    # add code to create a new genre if genre field is filled in  <label>Select an existing genre:</label>
  <br>
  <% @genres.each do |genre| %>
    <input type="checkbox" id="<%= genre.name %>" name="song[genre_ids][]" value="<%= genre.id %>"><%= genre.name %></input>
    <br>
  <% end %>
  <br><br>
  <label for="genre_name">And/or create a new genre:</label>
  <input type="text" id="genre_name" name="Genre Name"></input>
  <br>
    if movie.save
      redirect_to movie_path(movie)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :year, :genre_id)
    end


end
