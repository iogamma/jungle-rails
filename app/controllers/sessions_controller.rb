class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  def create
    user = User.find_by_email(user_params["email"])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(user_params["password"])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to root_path
    else
    # If user's login doesn't work, tell them
    # and send them back to the login form.
      flash[:alert] = "Your login credentials not matching"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,
                                   :password)
    end
end

