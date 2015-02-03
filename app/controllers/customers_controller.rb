class CustomersController < ApplicationController

	before_action :authenticate_employee!, :only => [:new, :create]

	def new
	  @customer = Customer.new
	end

	def create
	 @customer = current_employee.brand.customers.new(customer_params)
    if @customer.save
      if customer_params["date_of_birth(1i)"] == '1944'
        @customer.date_of_birth = nil 
        @customer.save
      end
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
    if @customer.update(customer_params)
      if customer_params["date_of_birth(1i)"] == '1944'
        @customer.date_of_birth = nil
        @customer.save
      end
      redirect_to customer_path(:id => @customer.id)
    else
      render :action => 'edit'
    end
  end

	def show
		@customer = Customer.find(params[:id])
		@measurement = @customer.measurements.last
    @appointment = current_employee.brand.appointments.where(customer_id: @customer.id).last
    params[:history] ||= nil
    @history = params[:history]
	end

  def index
    
    if params[:actividad] == '1'
      @search_domain = Customer.active
    elsif params[:actividad] == '2'
      @search_domain = Customer.inactive   
    else
      @search_domain = Customer.all
    end        
      @search  = @search_domain.search(params[:q])
      @results = @search.result.order("first_name ASC")
      @q = params[:q]
      @actividad = params[:actividad] || nil
      @customers = @results.paginate(:page => params[:page], :per_page => 15)
  end

  private

  def customer_params
    allow = [:first_name, :last_name, :marriage, :id_number, :address, :land_phone, :mobile_phone, :workplace, :email, :date_of_birth, :picture, :remote_picture_url]
    params.require(:customer).permit(allow)
  end

end