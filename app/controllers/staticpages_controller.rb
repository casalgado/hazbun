
class StaticpagesController < ApplicationController

	before_action :authenticate_brand!, :only => [:dashboard, :calendario]

	def dashboard
		@citas_de_hoy = current_brand.appointments.de_hoy.order("date ASC")
		@hoy = Date.today
	end

	def calendario
		# agregar citas desde el calendar view
		@appointments = current_brand.appointments
		gon.appointments = @appointments.to_fullcalendar
  end

  def json_feed
  	@appointments = current_brand.appointments.all
  	render :file => "json_feed.json.erb", :content_type => 'application/json'
  end
	
	def home
		if brand_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

end
