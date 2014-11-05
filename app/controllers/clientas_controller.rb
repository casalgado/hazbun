
class ClientasController < ApplicationController

	before_action :authenticate_marca!, :only => [:new, :create]

	def new
		@clienta = Clienta.new
	end

	def create
		@clienta = current_marca.clientas.new(clienta_params)
    if
		@clienta.save
    redirect_to clienta_path(@clienta)
    else
    render :action => 'new'
    end
	end

  def edit
    @clienta = Clienta.find(params[:id])
  end

  def update
    @clienta = Clienta.find(params[:id])
    if
      @clienta.update(clienta_params)
      redirect_to clienta_path(:id => @clienta.id)
    else
      render :action => 'edit'
    end
  end

	def show
		@clienta = Clienta.find(params[:id])
		@medida = @clienta.medidas.last
	end

  def index
  	@search = current_marca.clientas.search(params[:q])
  	@q = params[:q]
    @results = @search.result
    @clientas = []
    if params[:actividad] == '1'
    	@results.each do |clienta|
    		@clientas << clienta if clienta.activa?
    	end
    elsif params[:actividad] == '2'
    	 @results.each do |clienta|
    		@clientas << clienta unless clienta.activa?
    	end
    else
    	@clientas = @results
    end
  end

  private

  def clienta_params
    allow = [:nombre, :apellido, :direccion, :telefono, :email, :fecha_de_nacimiento, :picture, :remote_picture_url]
    params.require(:clienta).permit(allow)
  end

end