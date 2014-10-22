class OrdenesController < ApplicationController


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
    @orden.save
    redirect_to clienta_orden_path(:id => @orden.id)
  end

  def edit
    @tipos_de_prenda = TipoDePrenda.all
    @ocasiones = Ocasion.all
    @tipo_de_insumo = Insumo.all
    @orden = Orden.find(params[:id])
    @clienta = Clienta.find(params[:clienta_id])
  end

  def update
    @params = orden_params
    @orden = Orden.find(params[:id])
    @orden.update(orden_params)
    redirect_to clienta_orden_path(:id => @orden.id)
    
  end

  def show
    @orden = Orden.find(params[:id])
  end

  def index
  end

  def destroy
  end

  private 

  def orden_params
    params.require(:orden).permit(:id, :clienta_id, prendas_attributes: [:id, :tipo_de_prenda_id, :ocasion_id, :_destroy, insumos_attributes: [:id, :tipo_de_insumo, :cantidad, :_destroy]])
  end
end
