class SessionsController < ApplicationController
  # Render the login form
  def new
  end

  # Create a session (log in the user)
  def create
    @admin = Admin.find_by(username: params[:username])

    if @admin&.authenticate(params[:password])
      session[:admin_id] = @admin.id  # Store the admin ID in session
      redirect_to stats_path(@admin), notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid username or password."
      render :new
    end
  end

  # Destroy the session (log out the user)
  def destroy
    session[:admin_id] = nil  # Clear the session
    redirect_to root_path, notice: "Logged out successfully."
  end
end