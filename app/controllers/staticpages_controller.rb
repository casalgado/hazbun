
class StaticpagesController < ApplicationController

	before_action :authenticate_brand!, :only => [:dashboard, :calendario]

	def dashboard
		if params[:hoy]
			@hoy = Date.parse(params[:hoy])
		else
			@hoy = Date.today
		end
		if params[:shift_day] == '1'
      @hoy += 1
    elsif params[:shift_day] == '2'
      @hoy -= 1    
    else
      @hoy = Date.today
    end 
    @citas_de_hoy = current_brand.appointments.at_(@hoy).order("date ASC")
         
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

	def settings
		@occasion  = Occasion.new
		@item_type = ItemType.new
	end

end
