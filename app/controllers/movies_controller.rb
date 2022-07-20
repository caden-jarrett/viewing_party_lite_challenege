class MoviesController < ApplicationController
  # def top_rated
  #   @user = User.find(session[:user_id])
  #   # @movies = MovieFacade.top_rated_movies
  #   redirect_to "/movies"
  # end

  # def search
  #   binding.pry
  #   keyword = params[:query]
  #   @user = User.find(session[:user_id])
  #   @movies = MovieFacade.search_movie(keyword)
  #   redirect_to "/movies"
  # end

  def discover 
    @user = User.find(session[:user_id])
  end

  def index
    if params[:query] != nil
      @movies = MovieFacade.search_movie(params[:query])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show 
    @user = User.find(session[:user_id])
    @data = MovieFacade.movie_info(params[:id])
    render "movies/show"
  end

end