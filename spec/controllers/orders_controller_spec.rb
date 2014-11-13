require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

	 	before(:all) do
			@marca = Marca.first
		end

		before(:each) do
			@clienta = create(:clienta)
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end


		describe 'GET #new' do

			it "assigns a new order" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:order)).to be_a_new(Order)
			end
			
			it "assigns a new item" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:item)).to be_a_new(Item)
			end
			
			
		  it "assigns an existing clienta" do
		  	get :new, clienta_id: @clienta.id
				expect(assigns(:clienta)).to eq(@clienta)
			end
			
			it "assigns tipo de prenda list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:item_types)).to eq(ItemType.all)
			end
			
			it "assigns occasion list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:occasions)).to eq(Occasion.all)
			end
			
			it "assigns supply type list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:supplies)).to eq(Supply.all)
			end


		end

		describe 'GET #show' do

			before(:each) do

			end

			it "assigns an existing clienta" do
			end

			it "assigns an existing clientas measurements" do
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
						post :create, clienta_id: @clienta.id, order: attributes_for(:order, clienta_id: @clienta.id)
					}.to change(Order, :count).by(1)
				end

				it "redirects to clienta show page" do
					post :create, clienta_id: @clienta.id, order: attributes_for(:order, clienta_id: @clienta.id)
					expect(response).to redirect_to clienta_order_path(:id => Order.last.id)
				end

			end

			context "invalid orders" do

				it "does not belong to a client" do
				end

				it "there exists an open order" do
					post :create, clienta_id: @clienta.id, order: attributes_for(:order, clienta_id: @clienta.id)
					expect {
						post :create, clienta_id: @clienta.id, order: attributes_for(:order, clienta_id: @clienta.id)
					}.to_not change(Order, :count)
				end

			end
		end

		describe 'GET #edit' do

			before(:each) do
				@order = create(:order, clienta_id: @clienta.id)
			end			

			it "assigns an existing clienta" do
				get :edit, clienta_id: @clienta.id, id: @order.id
				expect(assigns(:clienta)).to eq(@clienta)
			end
						
			it "assigns an existing order" do
				get :edit, clienta_id: @clienta.id, id: @order.id
				expect(assigns(:order)).to eq(@order)
			end


			it "assigns tipo de prenda list" do
				get :edit, clienta_id: @clienta.id, id: @order.id
				expect(assigns(:item_types)).to eq(ItemType.all)
			end
			
			it "assigns occasion list" do
				get :edit, clienta_id: @clienta.id, id: @order.id
				expect(assigns(:occasions)).to eq(Occasion.all)
			end
			
			it "assigns supply type list" do
				get :edit, clienta_id: @clienta.id, id: @order.id
				expect(assigns(:supplies)).to eq(Supply.all)
			end

		end
 
		describe 'PUT #update' do

			before(:each) do
				@order = create(:order, clienta_id: @clienta.id)
			end		

			#context "with valid attributes" do
#
			#	it "locates clienta" do
			#		put :update, clienta_id: @clienta.id, id: @order.id
			#		expect(assigns(:clienta)).to eq(@clienta)
			#	end
#
			#	it "locates order" do
			#		put :update, clienta_id: @clienta.id, id: @order.id
			#		expect(assigns(:order)).to eq(@order)
			#	end
#
			#	it "updates order attributes" do
			#		put :update, clienta_id: @clienta, id: @order.id, order: attributes_for(:order, closed: true)
			#		@order.reload
			#		expect(@order.closed).to eq(true)
			#	end
#
			#	it "redirects to clienta show page" do
			#		put :update, clienta_id: @clienta, id: @order.id, order: attributes_for(:order, closed: true)
			#		expect(response).to redirect_to clienta_order_path(:id => @order.id)
			#	end
#
			#end

			context "with in-valid attributes" do

				it "does not update clienta" do
				end

				it "redirects to edit clienta page" do
				end

			end
		end

end
