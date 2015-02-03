class AppointmentsController < ApplicationController
  
  before_action :authenticate_employee!

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
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to customer_path(@customer)
    else
      render :action => 'edit'
    end
  end

  def create
    @customer = Customer.find(appointment_params[:customer_id])
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to customer_path(@customer)
    else
      render :action => 'new'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to dashboard_staticpages_path
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:id, :customer_id, :employee_id, :appointment_type_id, :brand_id, :date)
  end

end
