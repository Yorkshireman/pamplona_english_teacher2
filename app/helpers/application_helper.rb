module ApplicationHelper
	
	def userisadmin?
    	current_user.in_named_group?(:admin)
  	end

end
