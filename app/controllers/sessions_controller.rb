class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
      # Create an error message.
    end
  end

  def destroy
  end
end