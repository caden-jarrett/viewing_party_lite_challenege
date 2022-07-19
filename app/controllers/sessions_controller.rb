class SessionsController < ApplicationController

    def login_form 
    end 

    def login 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome, #{user.username}!"
            redirect_to "/users/#{user.id}"
        else
            redirect_to '/login'
            flash[:error] = "Sorry, your credentials are bad."
        end
    end
end