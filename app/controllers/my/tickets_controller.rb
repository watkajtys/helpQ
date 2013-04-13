class My::TicketsController < ApplicationController

	 before_filter :require_login
	 before_filter :require_ticket, except: [:index, :new, :create]


  def index
  	@tickets = current_user.tickets.order('tickets.created_at DESC').all
  end

  def new
  	 @ticket = current_user.tickets.build
  end

  def edit
  end

  def update
  	if @ticket.update_attributes params[:project]
  		redirect_to [:my, :tickets], notice: "UPDATED!"
  	else
  		render :edit
  	end
  end

  def create
  	@ticket = current_user.tickets.build params[:ticket]
  	if @ticket.save
  		redirect_to [:tickets], notice: "Ticket Created!"
  	else
  		render :new
  	end



  	def require_ticket
  		@ticket = current_user.tickets.find params[:id]
  	end

  end
end
