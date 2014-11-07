class CitasController < ApplicationController
  
  before_action :authenticate_marca!

  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@cita = Cita.new
  end

  def create
    @clienta = Clienta.find(cita_params[:clienta_id])
    @cita = Cita.new(cita_params)
    if
      @cita.save
      redirect_to clienta_path(@clienta)
    else
      render :action => 'new'
    end
  end



  private 

  def cita_params
    params.require(:cita).permit(:id, :clienta_id, :tipo_de_cita_id, :fecha)
  end

end
