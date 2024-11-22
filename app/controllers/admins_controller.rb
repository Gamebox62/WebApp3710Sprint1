class AdminsController < ApplicationController
  before_action :require_login, only: [:show]




    # Display the signup form
    def new
      @admin = Admin.new
    end
  
    # Handle the signup form submission
    def create
      @admin = Admin.new(admin_params)
      @admin.sign_up_date = Time.now  # Set the signup date
  
      if @admin.save
        redirect_to stats_path(@admin), notice: "Admin created successfully."
      else
        render :new
      end
    end
  
    private
  
    # Strong parameters to allow only necessary attributes for admin creation
    def admin_params
      params.require(:admin).permit(:username, :email, :password, :password_confirmation)
    end
  end
