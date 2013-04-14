module ApplicationHelper
	def current_ticket
    	@current_ticket ||= User.find(session[:user_id]).tickets.last
  	end

end
