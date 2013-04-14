class My::TicketsController < ApplicationController

	 before_filter :require_login
	 
  def status
    @ticket = Ticket.find params[:id]
    @ticket.update_attribute(:status, true)
    @ticket.save!
    redirect_to my_ticket_path(@ticket), notice: "YOU'RE BEING HELPED!"
  end

  def index
  	@tickets = current_user.tickets.order('tickets.created_at DESC').all
  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

  def new
  	 @ticket = current_user.tickets.build
  end

	def destroy
  		@ticket = Ticket.find(params[:id])
  		@ticket.destroy
  		redirect_to root_path
	end

  def edit
  	@ticket = Ticket.find params[:id]
  end

  def update
  	@ticket = Ticket.find params[:id]
  	if @ticket.update_attributes params[:ticket]
  		redirect_to my_ticket_path(@ticket), notice: "UPDATED!"
  	else
  		render :edit
  	end
  end

  def create
  	@ticket = current_user.tickets.build params[:ticket]
  	if @ticket.save
  		redirect_to my_ticket_path(@ticket), notice: "Ticket Created!"
  	else
  		render :new
  	end
  end

end
