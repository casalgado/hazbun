
class ClientsController < ApplicationController

	before_action :authenticate_marca!, :only => [:new, :create]

	def new
		@client = Client.new
	end

	def create
		@client = current_marca.clients.new(client_params)
    if
		@client.save
    redirect_to client_path(@client)
    else
    render :action => 'new'
    end
	end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if
      @client.update(client_params)
      redirect_to client_path(:id => @client.id)
    else
      render :action => 'edit'
    end
  end

	def show
		@client = Client.find(params[:id])
		@measurement = @client.measurements.last
	end

  def index
  	@search = current_marca.clients.search(params[:q])
  	@q = params[:q]
    @results = @search.result
    @clients = []
    if params[:actividad] == '1'
    	@results.each do |client|
    		@clients << client if client.activa?
    	end
    elsif params[:actividad] == '2'
    	 @results.each do |client|
    		@clients << client unless client.activa?
    	end
    else
    	@clients = @results
    end
  end

  private

  def client_params
    allow = [:nombre, :apellido, :direccion, :telefono, :email, :fecha_de_nacimiento, :picture, :remote_picture_url]
    params.require(:client).permit(allow)
  end

end