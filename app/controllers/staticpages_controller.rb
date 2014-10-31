
class StaticpagesController < ApplicationController

	before_action :authenticate_marca!, :only => [:dashboard, :calendario]

	def dashboard
		@citas_de_hoy = current_marca.citas.de_hoy.order("fecha ASC")
		@hoy = Date.today
	end

	def calendario
		@citas = current_marca.citas
		gon.citas = @citas.to_fullcalendar
		respond_to do |format|
			format.html
			format.json { render json: @citas.to_json }
		end
  end

  def json_feed
  	@citas = current_marca.citas.all
  	render :file => "json_feed.json.erb", :content_type => 'application/json'
  end
	
	def home
		if marca_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

end
