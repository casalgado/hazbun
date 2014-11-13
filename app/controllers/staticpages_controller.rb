
class StaticpagesController < ApplicationController

	before_action :authenticate_marca!, :only => [:dashboard, :calendario]

	def dashboard
		@citas_de_hoy = current_marca.appointments.de_hoy.order("date ASC")
		@hoy = Date.today
	end

	def calendario
		@appointments = current_marca.appointments
		gon.appointments = @appointments.to_fullcalendar
  end

  def json_feed
  	@appointments = current_marca.appointments.all
  	render :file => "json_feed.json.erb", :content_type => 'application/json'
  end
	
	def home
		if marca_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

end
