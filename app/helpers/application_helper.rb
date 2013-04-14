module ApplicationHelper
	def current_ticket
    	@current_ticket ||= User.find(session[:user_id]).tickets.last
  	end

  	def current_status
  		if User.find(session[:user_id]).tickets.last
  			@current_status ||= User.find(session[:user_id]).tickets.last.status
  		end
  	end
end
