class MeasurementsController < ApplicationController
  
  def new
  	@client = Client.find(params[:client_id])
  	@measurement = Measurement.new
  end

  def create
  	@measurement = Measurement.new(measurement_params)
  	@measurement.save
  	redirect_to client_path(:id => params[:client_id])
  end


  private 

  def measurement_params
    params.require(:measurement).permit(:client_id, :talle_frente, :talle_espalda, :imperio, :contorno, :espalda, :busto, :cintura, :cadera, :costado, :cotilla, :hombro)
  end

end
