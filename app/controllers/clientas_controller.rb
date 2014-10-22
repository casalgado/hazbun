
class ClientasController < ApplicationController

	before_action :authenticate_marca!, :only => [:new, :create]

	def new
		@clienta = Clienta.new
	end

	def create
		@clienta = current_marca.clientas.new(clienta_params)
		@clienta.save
	end

	def show
		@clienta = Clienta.find(params[:id])
		@ordenes_abiertas = @clienta.ordenes_abiertas
		@medida = @clienta.medidas.last
	end

  def index
  	@search = Clienta.search(params[:q])
    @clientas = @search.result
  end

  private

  def clienta_params
    allow = [:nombre, :apellido, :direccion, :telefono, :email, :fecha_de_nacimiento]
    params.require(:clienta).permit(allow)
  end

end