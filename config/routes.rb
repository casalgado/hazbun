Hazbun::Application.routes.draw do
  
  get "abonos/new"
  get "abonos/create"
  get "abonos/edit"
  get "abonos/update"
  get "abonos/show"
  get "abonos/index"
  get "abonos/destroy"
  get "new/create"
  get "new/edit"
  get "new/update"
  get "new/show"
  get "new/index"
  get "new/destroy"
  devise_for :clientas, path: 'c', :controllers => {:confirmations => 'confirmations'}
	devise_for :marcas, controllers: { sessions: "marcas/sessions" }

  

  devise_scope :clienta do
      put "/c/confirm" => "confirmations#confirm", :as => :clienta_confirm
    end
  
	root :to => "staticpages#home"

	resource :staticpages, :path => '' do 
		get 'dashboard'
	end

  resources :clientas do
  	resources :ordenes
    resources :medidas
    resources :citas
  end

  resources :ordenes do
    resources :abonos
  end


end
