class PaymentsController < ApplicationController
  
  def new
    @payment = Payment.new
    @order = Order.find(params[:order_id])
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save
    redirect_to :back
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private 

  def payment_params
    params.require(:payment).permit(:id, :order_id, :date, :amount)
  end

end
