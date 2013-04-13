class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = login(params[:email], params[:password])
    if @user
      redirect_to :root, :notice => "Welcome back"
    else
      flash.now[:alert] = "Invalid credentials. Try again?"
      render :new
    end
  end

  def destroy
  	logout
    redirect_to :root, notice: "Goodbye!"
  end
end
