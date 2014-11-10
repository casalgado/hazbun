require 'rails_helper'

RSpec.describe ClientasController do

	 	before(:all) do
			@marca = Marca.first
		end

		before(:each) do
			@clienta = create(:clienta)
			login(:marca)
		end

		describe 'GET #new' do

			it "assigns a new clienta" do
				get :new
				expect(assigns(:clienta)).to be_a_new(Clienta)
			end

		end

		describe 'GET #show' do

			it "assigns an existing clienta" do
				get :show, id: @clienta
				@medida = create(:medida, clienta_id: @clienta.id)
				assigns[:clienta] = @clienta
				assigns[:medida] = @clienta.medidas.last
				@clienta.medidas.last.talle_frente.should eq("60")
			end

			it "assigns an existing clientas medidas" do
				get :show, id: @clienta
				@medida = create(:medida, clienta_id: @clienta.id)
				assigns[:medida] = @clienta.medidas.last
			end
			
			it "shows correct medida value" do
				get :show, id: @clienta
				@medida = create(:medida, clienta_id: @clienta.id)
				@clienta.medidas.last.talle_frente.should eq("60")
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
					response.should redirect_to clienta_path(Clienta.last)
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
						response.should render_template :new
				end

			end
		end

		describe 'GET #edit' do

			it "assigns an existing clienta" do
				get :edit, id: @clienta.id
				assigns[:clienta] = @clienta
			end
		end
 
		describe 'POST #update' do

			context "with valid attributes" do

				it "locates clienta" do
					put :update, id: @clienta, clienta: attributes_for(:clienta)
					assigns[:clienta] = @clienta
				end

				it "updates clienta attributes" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, nombre: "new_name")
					@clienta.reload
					@clienta.nombre.should eq("new_name")
				end

				it "redirects to clienta show page" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, nombre: "new_name")
					response.should redirect_to clienta_path(@clienta)
				end

			end

			context "with in-valid attributes" do

				it "does not update clienta" do
					email = @clienta.email
					put :update, id: @clienta, clienta: attributes_for(:clienta, email: nil)
					@clienta.reload
					@clienta.email.should eq(email)
				end

				it "redirects to edit clienta page" do
					put :update, id: @clienta, clienta: attributes_for(:clienta, email: nil)
					response.should render_template :edit
				end

			end
		end

end
