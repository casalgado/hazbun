class MedidasController < ApplicationController
  
  def new
  	@clienta = Clienta.find(params[:clienta_id])
  	@medida = Medida.new
  end

  def create
  	@medida = Medida.new(medida_params)
  	@medida.save
  	redirect_to clienta_path(:id => params[:clienta_id])
  end


  private 

  def medida_params
    params.require(:medida).permit(:clienta_id, :talle_frente, :talle_espalda, :imperio, :contorno, :espalda, :busto, :cintura, :cadera, :costado, :cotilla, :hombro)
  end

end
