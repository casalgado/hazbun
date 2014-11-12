require 'rails_helper'

RSpec.describe OrdenesController, :type => :controller do

	 	before(:all) do
			@marca = Marca.first
		end

		before(:each) do
			@clienta = create(:clienta)
			@request.env["devise.mapping"] = Devise.mappings[:marca]
			sign_in @marca
		end


		describe 'GET #new' do

			it "assigns a new orden" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:orden)).to be_a_new(Orden)
			end
			
			it "assigns a new prenda" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:prenda)).to be_a_new(Prenda)
			end
			
			it "assigns a new material" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:material)).to be_a_new(Material)
			end
			
		  it "assigns an existing clienta" do
		  	get :new, clienta_id: @clienta.id
				expect(assigns(:clienta)).to eq(@clienta)
			end
			
			it "assigns tipo de prenda list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:tipos_de_prenda)).to eq(TipoDePrenda.all)
			end
			
			it "assigns ocasion list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:ocasiones)).to eq(Ocasion.all)
			end
			
			it "assigns tipo de insumo list" do
				get :new, clienta_id: @clienta.id
				expect(assigns(:tipo_de_insumo)).to eq(Insumo.all)
			end


		end

		describe 'GET #show' do

			before(:each) do

			end

			it "assigns an existing clienta" do
			end

			it "assigns an existing clientas medidas" do
			end
			
			it "shows correct medida value" do
			end



		end

		describe 'POST #create' do

			before(:each) do

			end

			context "with valid attributes" do

				it "saves a new orden in the database" do
					expect {
						post :create, clienta_id: @clienta.id, orden: attributes_for(:orden, clienta_id: @clienta.id)
					}.to change(Orden, :count).by(1)
				end

				it "redirects to clienta show page" do
					post :create, clienta_id: @clienta.id, orden: attributes_for(:orden, clienta_id: @clienta.id)
					expect(response).to redirect_to clienta_orden_path(:id => Orden.last.id)
				end

			end

			context "invalid orders" do

				it "does not belong to a client" do
				end

				it "there exists an open order" do
					post :create, clienta_id: @clienta.id, orden: attributes_for(:orden, clienta_id: @clienta.id)
					expect {
						post :create, clienta_id: @clienta.id, orden: attributes_for(:orden, clienta_id: @clienta.id)
					}.to_not change(Orden, :count)
				end

			end
		end

		describe 'GET #edit' do

			before(:each) do
				@orden = create(:orden, clienta_id: @clienta.id)
			end			

			it "assigns an existing clienta" do
				get :edit, clienta_id: @clienta.id, id: @orden.id
				expect(assigns(:clienta)).to eq(@clienta)
			end
						
			it "assigns an existing orden" do
				get :edit, clienta_id: @clienta.id, id: @orden.id
				expect(assigns(:orden)).to eq(@orden)
			end


			it "assigns tipo de prenda list" do
				get :edit, clienta_id: @clienta.id, id: @orden.id
				expect(assigns(:tipos_de_prenda)).to eq(TipoDePrenda.all)
			end
			
			it "assigns ocasion list" do
				get :edit, clienta_id: @clienta.id, id: @orden.id
				expect(assigns(:ocasiones)).to eq(Ocasion.all)
			end
			
			it "assigns tipo de insumo list" do
				get :edit, clienta_id: @clienta.id, id: @orden.id
				expect(assigns(:tipo_de_insumo)).to eq(Insumo.all)
			end

		end
 
		describe 'PUT #update' do

			before(:each) do
				@orden = create(:orden, clienta_id: @clienta.id)
			end		

			context "with valid attributes" do

				it "locates clienta" do
					put :update, clienta_id: @clienta.id, id: @orden.id
					expect(assigns(:clienta)).to eq(@clienta)
				end

				it "locates orden" do
					put :update, clienta_id: @clienta.id, id: @orden.id
					expect(assigns(:orden)).to eq(@orden)
				end

				it "updates orden attributes" do
					put :update, clienta_id: @clienta, id: @orden.id, orden: attributes_for(:orden, cerrada: true)
					@orden.reload
					expect(@orden.cerrada).to eq(true)
				end

				it "redirects to clienta show page" do
					put :update, clienta_id: @clienta, id: @orden.id, orden: attributes_for(:orden, cerrada: true)
					expect(response).to redirect_to clienta_orden_path(:id => @orden.id)
				end

			end

			context "with in-valid attributes" do

				it "does not update clienta" do
				end

				it "redirects to edit clienta page" do
				end

			end
		end

end
