class StaticpagesController < ApplicationController

	before_action :authenticate_employee!, :only => [:dashboard, :calendar]

	def dashboard
		if params[:today]
			@today = Date.parse(params[:today]) 
			@today += params[:shift_day].to_i
		else
			@today = Date.today
		end
    @todays_appointments = current_employee.brand.appointments.at_(@today).order("date ASC")
	end

	def calendar
		@appointments = current_employee.brand.appointments
		gon.appointments = @appointments.to_fullcalendar
  end
	
	def home
		if employee_signed_in?
			redirect_to dashboard_staticpages_path
		end
	end

	def settings
		@occasion  = Occasion.new
		@item_type = ItemType.new
	end

end
