
class CustomersController < ApplicationController

	before_action :authenticate_brand!, :only => [:new, :create]

	def new
		@customer = Customer.new
	end

	def create
		@customer = current_brand.customers.new(customer_params)
    if
		@customer.save
    redirect_to customer_path(@customer)
    else
    render :action => 'new'
    end
	end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if
      @customer.update(customer_params)
      redirect_to customer_path(:id => @customer.id)
    else
      render :action => 'edit'
    end
  end

	def show
		@customer = Customer.find(params[:id])
		@measurement = @customer.measurements.last
    params[:history] ||= nil
    @history = params[:history]
	end

  def index
  	@search = current_brand.customers.search(params[:q])
  	@q = params[:q]
    @results = @search.result.order("nombre ASC")
    @customers = []
    if params[:actividad] == '1'
    	@results.each do |customer|
    		@customers << customer if customer.activa?
    	end
    elsif params[:actividad] == '2'
    	 @results.each do |customer|
    		@customers << customer unless customer.activa?
    	end
    else
    	@customers = @results
    end
  end

  private

  def customer_params
    allow = [:nombre, :apellido, :direccion, :telefono, :email, :fecha_de_nacimiento, :picture, :remote_picture_url]
    params.require(:customer).permit(allow)
  end

end