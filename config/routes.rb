Hazbun::Application.routes.draw do
  


  devise_for :brands, controllers: { sessions: "brands/sessions" }
  devise_for :clientas, path: 'c', :controllers => {:confirmations => 'confirmations'}
	devise_for :marcas

  

  devise_scope :clienta do
      put "/c/confirm" => "confirmations#confirm", :as => :clienta_confirm
    end
  
	root :to => "staticpages#home"

	resource :staticpages, :path => '' do 
		get 'dashboard'
    get 'calendario'
    get 'json_feed'
	end

  resources :clientas do
  	resources :orders
    resources :measurements
    resources :appointments
  end

  resources :orders do
    resources :payments
  end

end
