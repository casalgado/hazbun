class StaticpagesController < ApplicationController

	before_action :authenticate_marca!, :only => [:dashboard]

	def dashboard
		@citas_de_hoy = Cita.de_hoy.order("fecha ASC")
		@hoy = Date.today
	end
	
	def home
		if marca_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

end
