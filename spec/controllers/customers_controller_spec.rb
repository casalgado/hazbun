require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

	 	before(:all) do
			@brand = Brand.first
		end

		before(:each) do
			@customer = create(:customer)
			@request.env["devise.mapping"] = Devise.mappings[:brand]
			sign_in @brand
		end


		describe 'GET #new' do

			it "assigns a new customer" do
				get :new
				expect(assigns(:customer)).to be_a_new(Customer)
			end

		end

		describe 'GET #show' do

			before(:each) do
				@measurement = create(:measurement, customer_id: @customer.id)
			end

			it "assigns an existing customer" do
				get :show, id: @customer
				expect(assigns(:customer)).to eq(@customer)
				expect(assigns(:measurement)).to eq(@customer.measurements.last)
				expect(@customer.measurements.last.talle_frente).to eq("60")
			end

			it "assigns an existing customers measurements" do
				get :show, id: @customer
				expect(assigns(:measurement)).to eq(@customer.measurements.last)
			end
			
			it "shows correct measurement value" do
				get :show, id: @customer
				expect(@customer.measurements.last.talle_frente).to eq("60")
			end



		end

		describe 'POST #create' do

			context "with valid attributes" do

				it "saves a new customer in the database" do
					expect {
						post :create, customer: attributes_for(:customer)
					}.to change(Customer, :count).by(1)
				end

				it "redirects to customer show page" do
					post :create, customer: attributes_for(:customer)
					expect(response).to redirect_to customer_path(Customer.last)
				end

			end

			context "with in-valid attributes" do

				it "does not save the new customer in the database" do
					expect {
						post :create, customer: attributes_for(:customer, email: nil)
					}.to_not change(Customer, :count)
				end

				it "redirects to new customer page" do
						post :create, customer: attributes_for(:customer, email: nil)
						expect(response).to render_template :new
				end

			end
		end

		describe 'GET #edit' do

			it "assigns an existing customer" do
				get :edit, id: @customer.id
				expect(assigns(:customer)).to eq(@customer)
			end
		end
 
		describe 'PUT #update' do

			context "with valid attributes" do

				it "locates customer" do
					put :update, id: @customer, customer: attributes_for(:customer)
				expect(assigns(:customer)).to eq(@customer)
				end

				it "updates customer attributes" do
					put :update, id: @customer, customer: attributes_for(:customer, first_name: "new_name")
					@customer.reload
					expect(@customer.first_name).to eq("New Name")
				end

				it "redirects to customer show page" do
					put :update, id: @customer, customer: attributes_for(:customer, first_name: "new_name")
					expect(response).to redirect_to customer_path(@customer)
				end

			end

			context "with in-valid attributes" do

				it "does not update customer" do
					email = @customer.email
					put :update, id: @customer, customer: attributes_for(:customer, email: nil)
					@customer.reload
					expect(@customer.email).to eq(email)
				end

				it "redirects to edit customer page" do
					put :update, id: @customer, customer: attributes_for(:customer, email: nil)
					expect(response).to render_template :edit
				end

			end
		end

end
