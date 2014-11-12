class OrdenesController < ApplicationController

  before_action :authenticate_marca!, :except => [:show]

  def new
    @orden = Orden.new
    @prenda = Prenda.new
    @material = Material.new
    @clienta = Clienta.find(params[:clienta_id])
    @tipos_de_prenda = TipoDePrenda.all
    @ocasiones = Ocasion.all
    1.times do 
      prenda = @orden.prendas.build
      1.times { prenda.insumos.build }
     end
    @tipo_de_insumo = Insumo.all
  end

  def create
    @orden = Orden.new(orden_params)
    @clienta = Clienta.find(orden_params[:clienta_id])
    @tipos_de_prenda = TipoDePrenda.all
    @ocasiones = Ocasion.all
    @tipo_de_insumo = Insumo.all
    @errors = @orden.errors
    if @orden.save
      redirect_to clienta_orden_path(:id => @orden.id)
    else 
      render :action => 'new'
    end
  end

  def edit
    @tipos_de_prenda = TipoDePrenda.all
    @ocasiones = Ocasion.all
    @tipo_de_insumo = Insumo.all
    @orden = Orden.find(params[:id])
    @clienta = Clienta.find(params[:clienta_id])
  end

  def update
    @tipos_de_prenda = TipoDePrenda.all
    @ocasiones = Ocasion.all
    @tipo_de_insumo = Insumo.all
    @clienta = Clienta.find(params[:clienta_id])
    @params = orden_params
    @orden = Orden.find(params[:id])
    if
      @orden.update(orden_params)
      redirect_to clienta_orden_path(:id => @orden.id)
    else
      render :action => 'edit'
    end
    
  end

  def show
    @orden = Orden.find(params[:id])
    @clienta = Clienta.find(params[:clienta_id])
    @abono = Abono.new
    @cita = Cita.new
    if params[:cerrar]
      if @orden.cerrable?
        @orden.cerrar
      else
        #notice
      end
    end
  end

  def index
    @ordenes = current_marca.ordenes.where(:cerrada => false)
  end

  def destroy
  end

  private 

  def orden_params
    params.require(:orden).permit(:id, :clienta_id, prendas_attributes: [:id, :tipo_de_prenda_id, :ocasion_id, :_destroy, :picture, :remote_picture_url, insumos_attributes: [:id, :tipo_de_insumo, :cantidad, :_destroy]])
  end
end
