class StaticpagesController < ApplicationController

	before_action :authenticate_marca!, :only => [:dashboard, :calendario]

	def dashboard
		@citas_de_hoy = Cita.de_hoy.order("fecha ASC")
		@hoy = Date.today
	end

	def calendario
		@citas = Cita.all
		respond_to do |format|
			format.html
			format.json { render json: @citas.to_json }
		end

  end
	
	def home
		if marca_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

end
