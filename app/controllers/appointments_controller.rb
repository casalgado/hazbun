class AppointmentsController < ApplicationController
  
  before_action :authenticate_marca!

  def new
  	@client = Client.find(params[:client_id])
  	@appointment = Appointment.new
  end

  def create
    @client = Client.find(appointment_params[:client_id])
    @appointment = Appointment.new(appointment_params)
    if
      @appointment.save
      redirect_to client_path(@client)
    else
      render :action => 'new'
    end
  end



  private 

  def appointment_params
    params.require(:appointment).permit(:id, :client_id, :appointment_type_id, :date)
  end

end
