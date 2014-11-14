class MeasurementsController < ApplicationController
  
  def new
  	@customer = Customer.find(params[:customer_id])
  	@measurement = Measurement.new
  end

  def create
  	@measurement = Measurement.new(measurement_params)
  	@measurement.save
  	redirect_to customer_path(:id => params[:customer_id])
  end


  private 

  def measurement_params
    params.require(:measurement).permit(:customer_id, :talle_frente, :talle_espalda, :imperio, :contorno, :espalda, :busto, :cintura, :cadera, :costado, :cotilla, :hombro)
  end

end
