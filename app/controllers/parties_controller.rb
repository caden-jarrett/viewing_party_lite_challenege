class PartiesController < ApplicationController

    def new
        @user = User.find(session[:user_id])
        @movie = MovieFacade.movie_info(params[:id])
        @all_users = User.all
    end

    def create 
        user = User.find(session[:user_id])
        movie = MovieFacade.movie_info(params[:id])
        viewing_party = user.parties.create({ 
                                    duration: params[:duration],
                                    date: params[:date],
                                    time: params[:time],
                                    user_id: user.id,
                                    movie_id: movie.id,
                                    user_name: user.name,
                                    movie_title: movie.title
                                    })

        redirect_to "/dashboard"
    end



    # def viewing_params
    #     params.permit(:duration, :date, :time, :user_id, :movie_id, :user_name)
    # end
end