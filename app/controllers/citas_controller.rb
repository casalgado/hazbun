class CitasController < ApplicationController
  
  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@cita = Cita.new

  end

  def create
    @cita = Cita.new(cita_params)
  	@cita.save
  end

  private 

  def cita_params
    params.require(:cita).permit(:id, :clienta_id, :tipo_de_cita)
  end

end
