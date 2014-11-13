class OrdersController < ApplicationController

  before_action :authenticate_marca!, :except => [:show]

  def new
    @order = Order.new
    @item = Item.new
    @clienta = Clienta.find(params[:clienta_id])
    @item_types = ItemType.all
    @occasions = Occasion.all
    1.times do 
      item = @order.items.build
      1.times { item.supplies.build }
     end
    @supplies = Supply.all
  end

  def create
    @order = Order.new(order_params)
    @clienta = Clienta.find(order_params[:clienta_id])
    @item_types = ItemType.all
    @occasions = Occasion.all
    @supplies = Supply.all
    @errors = @order.errors
    if @order.save
      redirect_to clienta_order_path(:id => @order.id)
    else 
      render :action => 'new'
    end
  end

  def edit
    @item_types = ItemType.all
    @occasions = Occasion.all
    @supplies = Supply.all
    @order = Order.find(params[:id])
    @clienta = Clienta.find(params[:clienta_id])
  end

  def update
    @item_types = ItemType.all
    @occasions = Occasion.all
    @supplies = Supply.all
    @clienta = Clienta.find(params[:clienta_id])
    @params = order_params
    @order = Order.find(params[:id])
    if
      @order.update(order_params)
      redirect_to clienta_order_path(:id => @order.id)
    else
      render :action => 'edit'
    end
    
  end

  def show
    @order = Order.find(params[:id])
    @clienta = Clienta.find(params[:clienta_id])
    @payment = Payment.new
    @appointment = Appointment.new
    if params[:cerrar]
      if @order.cerrable?
        @order.cerrar
      else
        #notice
      end
    end
  end

  def index
    @orders = current_marca.orders.where(:closed => false)
  end

  def destroy
  end

  private 

  def order_params
    params.require(:order).permit(:id, :clienta_id, items_attributes: [:id, :item_type_id, :occasion_id, :_destroy, :picture, :remote_picture_url, supplies_per_items_attributes: [:id, :supply_id, :quantity, :_destroy]])
  end
end
