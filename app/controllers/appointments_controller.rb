class AppointmentsController < ApplicationController
  
  before_action :authenticate_brand!

  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@appointment = Appointment.new
  end

  def create
    @clienta = Clienta.find(appointment_params[:clienta_id])
    @appointment = Appointment.new(appointment_params)
    if
      @appointment.save
      redirect_to clienta_path(@clienta)
    else
      render :action => 'new'
    end
  end



  private 

  def appointment_params
    params.require(:appointment).permit(:id, :clienta_id, :appointment_type_id, :date)
  end

end
