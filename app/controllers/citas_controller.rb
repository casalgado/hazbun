require 'byebug'
class CitasController < ApplicationController
  
  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@cita = Cita.new

  end

  def create
    new_params = cita_params.clone
    new_params["fecha"] = cita_params["fecha"].change_date_format
    @cita = Cita.new(new_params)
    @cita.save

  end

  private 

  def cita_params
    params.require(:cita).permit(:id, :clienta_id, :tipo_de_cita_id, :fecha)
  end

end
