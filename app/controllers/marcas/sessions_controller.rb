class Marcas::SessionsController < Devise::SessionsController

	before_action :authenticate_marca!, :only => [:dashboard]

	def dashboard
		
	end

end