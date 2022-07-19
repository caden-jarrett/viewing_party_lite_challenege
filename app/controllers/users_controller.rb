class UsersController < ApplicationController

  def new
    
  end
  

  def create
    user = User.new(user_params)
    # checks to see if user can be saved, and will save it if possible
    if user.save 
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.username}!"
    else 
      redirect_to '/register'
      user.errors.full_messages.each do |message|
        flash[:failure] = message
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login_form 

  end

  def login 
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to '/login'
    end
  end

  private
    def user_params
      params.permit(:name, :email, :username, :password, :password_confirmation)
    end
end