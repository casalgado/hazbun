require 'byebug'
class CitasController < ApplicationController
  
  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@cita = Cita.new
  end

  def create
    @cita = Cita.new(cita_params)
    @cita.save
    redirect_to :back
  end



  private 

  def cita_params
    params.require(:cita).permit(:id, :clienta_id, :tipo_de_cita_id, :fecha)
  end

end
