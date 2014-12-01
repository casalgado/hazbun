class AppointmentsController < ApplicationController
  
  before_action :authenticate_brand!

  def new
  	@customer = Customer.find(params[:customer_id])
  	@appointment = Appointment.new
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    @customer = Customer.find(appointment_params[:customer_id])
    @appointment = Appointment.new(appointment_params)
    if
    @appointment.save
      redirect_to customer_path(@customer)
    else
      render :action => 'edit'
    end
  end

  def create
    @customer = Customer.find(appointment_params[:customer_id])
    @appointment = Appointment.new(appointment_params)
    if
      @appointment.save
      redirect_to customer_path(@customer)
    else
      render :action => 'new'
    end
  end



  private 

  def appointment_params
    params.require(:appointment).permit(:id, :customer_id, :appointment_type_id, :date)
  end

end
