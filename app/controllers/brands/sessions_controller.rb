class Brands::SessionsController < Devise::SessionsController
	
	before_action :authenticate_brand!, :only => [:dashboard]
	before_action :authenticate_employee!, :only => [:dashboard]

	def dashboard
		
	end

end
