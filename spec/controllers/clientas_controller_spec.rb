require 'rails_helper'

RSpec.describe ClientasController, :type => :controller do

	 	before(:all) do
			@marca = Marca.first
		end

		before(:each) do
			@clienta = create(:clienta)
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end


		describe 'GET #new' do

			it "assigns a new clienta" do
				get :new
				expect(assigns(:clienta)).to be_a_new(Clienta)
			end

		end

		describe 'GET #show' do

			before(:each) do
				@measurement = create(:measurement, clienta_id: @clienta.id)
			end

			it "assigns an existing clienta" do
				get :show, id: @clienta
				expect(assigns(:clienta)).to eq(@clienta)
				expect(assigns(:measurement)).to eq(@clienta.measurements.last)
				expect(@clienta.measurements.last.talle_frente).to eq("60")
			end

			it "assigns an existing clientas measurements" do
				get :show, id: @clienta
				expect(assigns(:measurement)).to eq(@clienta.measurements.last)
			end
			
			it "shows correct measurement value" do
				get :show, id: @clienta
				expect(@clienta.measurements.last.talle_frente).to eq("60")
			end



		end

		describe 'POST #create' do

			context "with valid attributes" do

				it "saves a new clienta in the database" do
					expect {
						post :create, clienta: attributes_for(:clienta)
					}.to change(Clienta, :count).by(1)
				end

				it "redirects to clienta show page" do
					post :create, clienta: attributes_for(:clienta)
					expect(response).to redirect_to clienta_path(Clienta.last)
				end

			end

			context "with in-valid attributes" do

				it "does not save the new clienta in the database" do
					expect {
						post :create, clienta: attributes_for(:clienta, email: nil)
					}.to_not change(Clienta, :count)
				end

				it "redirects to new clienta page" do
						post :create, clienta: attributes_for(:clienta, email: nil)
						expect(response).to render_template :new
				end

			end
		end

		describe 'GET #edit' do

			it "assigns an existing clienta" do
				get :edit, id: @clienta.id
				expect(assigns(:clienta)).to eq(@clienta)
			end
		end
 
		describe 'PUT #update' do

			context "with valid attributes" do

				it "locates clienta" do
					put :update, id: @clienta, clienta: attributes_for(:clienta)
				expect(assigns(:clienta)).to eq(@clienta)
				end

				it "updates clienta attributes" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, nombre: "new_name")
					@clienta.reload
					expect(@clienta.nombre).to eq("new_name")
				end

				it "redirects to clienta show page" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, nombre: "new_name")
					expect(response).to redirect_to clienta_path(@clienta)
				end

			end

			context "with in-valid attributes" do

				it "does not update clienta" do
					email = @clienta.email
					put :update, id: @clienta, clienta: attributes_for(:clienta, email: nil)
					@clienta.reload
					expect(@clienta.email).to eq(email)
				end

				it "redirects to edit clienta page" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, email: nil)
					expect(response).to render_template :edit
				end

			end
		end

end
