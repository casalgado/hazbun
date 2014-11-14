class Brands::SessionsController < Devise::SessionsController
	
	before_action :authenticate_brand!, :only => [:dashboard]

	def dashboard
		
	end

end
