class MeasurementsController < ApplicationController
  
  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@measurement = Measurement.new
  end

  def create
  	@measurement = Measurement.new(measurement_params)
  	@measurement.save
  	redirect_to clienta_path(:id => params[:clienta_id])
  end


  private 

  def measurement_params
    params.require(:measurement).permit(:clienta_id, :talle_frente, :talle_espalda, :imperio, :contorno, :espalda, :busto, :cintura, :cadera, :costado, :cotilla, :hombro)
  end

end
