require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

		before(:each) do
			@employee = create(:employee)
			@customer = create(:customer)
			@request.env["devise.mapping"] = Devise.mappings[:employee]
			sign_in @employee
		end


		describe 'GET #new' do

			it "assigns a new order" do
				get :new, customer_id: @customer.id
				expect(assigns(:order)).to be_a_new(Order)
			end
			
			it "assigns a new item" do
				get :new, customer_id: @customer.id
				expect(assigns(:item)).to be_a_new(Item)
			end
			
			
		  it "assigns an existing customer" do
		  	get :new, customer_id: @customer.id
				expect(assigns(:customer)).to eq(@customer)
			end
			
			it "assigns tipo de prenda list" do
				get :new, customer_id: @customer.id
				expect(assigns(:item_types)).to eq(ItemType.all)
			end
			
			it "assigns occasion list" do
				get :new, customer_id: @customer.id
				expect(assigns(:occasions)).to eq(Occasion.all)
			end
			
			it "assigns supply type list" do
				get :new, customer_id: @customer.id
				expect(assigns(:supplies)).to eq(Supply.all)
			end


		end

		describe 'GET #show' do

			before(:each) do

			end

			it "assigns an existing customer" do
			end

			it "assigns an existing customers measurements" do
			end
			
			it "shows correct measurement value" do
			end



		end

		describe 'POST #create' do

			before(:each) do

			end

			context "with valid attributes" do

				it "saves a new order in the database" do
					expect {
						post :create, customer_id: @customer.id, order: attributes_for(:order, customer_id: @customer.id)
					}.to change(Order, :count).by(1)
				end

				it "redirects to customer show page" do
					post :create, customer_id: @customer.id, order: attributes_for(:order, customer_id: @customer.id)
					expect(response).to redirect_to customer_order_path(:id => Order.last.id)
				end

			end

			context "invalid orders" do

				it "does not belong to a customer" do
				end

				it "there exists an open order" do
					post :create, customer_id: @customer.id, order: attributes_for(:order, customer_id: @customer.id)
					expect {
						post :create, customer_id: @customer.id, order: attributes_for(:order, customer_id: @customer.id)
					}.to_not change(Order, :count)
				end

			end
		end

		describe 'GET #edit' do

			before(:each) do
				@order = create(:order, customer_id: @customer.id)
			end			

			it "assigns an existing customer" do
				get :edit, customer_id: @customer.id, id: @order.id
				expect(assigns(:customer)).to eq(@customer)
			end
						
			it "assigns an existing order" do
				get :edit, customer_id: @customer.id, id: @order.id
				expect(assigns(:order)).to eq(@order)
			end


			it "assigns tipo de prenda list" do
				get :edit, customer_id: @customer.id, id: @order.id
				expect(assigns(:item_types)).to eq(ItemType.all)
			end
			
			it "assigns occasion list" do
				get :edit, customer_id: @customer.id, id: @order.id
				expect(assigns(:occasions)).to eq(Occasion.all)
			end
			
			it "assigns supply type list" do
				get :edit, customer_id: @customer.id, id: @order.id
				expect(assigns(:supplies)).to eq(Supply.all)
			end

		end
 
		describe 'PUT #update' do

			before(:each) do
				@order = create(:order, customer_id: @customer.id)
			end		

			#context "with valid attributes" do
#
			#	it "locates customer" do
			#		put :update, customer_id: @customer.id, id: @order.id
			#		expect(assigns(:customer)).to eq(@customer)
			#	end
#
			#	it "locates order" do
			#		put :update, customer_id: @customer.id, id: @order.id
			#		expect(assigns(:order)).to eq(@order)
			#	end
#
			#	it "updates order attributes" do
			#		put :update, customer_id: @customer, id: @order.id, order: attributes_for(:order, closed: true)
			#		@order.reload
			#		expect(@order.closed).to eq(true)
			#	end
#
			#	it "redirects to customer show page" do
			#		put :update, customer_id: @customer, id: @order.id, order: attributes_for(:order, closed: true)
			#		expect(response).to redirect_to customer_order_path(:id => @order.id)
			#	end
#
			#end

			context "with in-valid attributes" do

				it "does not update customer" do
				end

				it "redirects to edit customer page" do
				end

			end
		end

end
