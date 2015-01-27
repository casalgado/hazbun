require 'rails_helper'

RSpec.describe AppointmentsController, :type => :controller do
	render_views

		before(:each) do
			@employee = create(:employee)
			@customer = create(:customer)
			@request.env["devise.mapping"] = Devise.mappings[:employee]
			sign_in @employee
		end

		describe 'GET #new' do

			it "assigns a new appointment" do
				get :new, customer_id: @customer.id
				expect(assigns(:appointment)).to be_a_new(Appointment)
			end

			it "assigns an existing customer" do
				get :new, customer_id: @customer.id
				expect(assigns(:customer)).to eq(@customer)
			end

			it "renders new template" do
				get :new, customer_id: @customer.id
				expect(response).to render_template(:new)
			end	 
		end

		describe 'POST #create' do



			context "with valid attributes" do

				it "saves a new appointment in the database" do
					expect {
						post :create, customer_id: @customer.id, appointment: attributes_for(:next_month_appointment, customer_id: @customer.id)
					}.to change(Appointment, :count).by(1)
				end

				it "redirects to customer show page" do
					  post :create, customer_id: @customer.id, appointment: attributes_for(:next_month_appointment, customer_id: @customer.id)
					expect(response).to redirect_to customer_path(@customer)
				end

			end

			context "with in-valid attributes" do

				it "does not save the new appointment in the database" do
					expect {
						post :create, customer_id: @customer.id, appointment: attributes_for(:invalid_appointment, customer_id: @customer.id)
					}.to_not change(Appointment, :count)
				end

				it "redirects to new appointment page" do
						post :create, customer_id: @customer.id, appointment: attributes_for(:invalid_appointment, customer_id: @customer.id)
						expect(response).to render_template :new
				end

			end
		end


end
