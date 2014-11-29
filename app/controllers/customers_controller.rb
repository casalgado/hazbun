
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
    
    if params[:actividad] == '1'
      @search_domain = current_brand.customers.active
    elsif params[:actividad] == '2'
      @search_domain = current_brand.customers.inactive   
    else
      @search_domain = current_brand.customers
    end        
      @search  = @search_domain.search(params[:q])
      @results = @search.result.order("first_name ASC")
      @q = params[:q]
      @actividad = params[:actividad] || nil
      @customers = @results.paginate(:page => params[:page], :per_page => 15)
  end

  private

  def customer_params
    allow = [:first_name, :last_name, :address, :land_phone, :email, :date_of_birth, :picture, :remote_picture_url]
    params.require(:customer).permit(allow)
  end

end