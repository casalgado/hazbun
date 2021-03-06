Hazbun::Application.routes.draw do
  



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :employees, controllers: { sessions: "employees/sessions" }
  devise_for :brands, controllers: { sessions: "brands/sessions" }
  devise_for :customers, path: 'c', :controllers => {:confirmations => 'confirmations'}
  

  devise_scope :customer do
      put "/c/confirm" => "confirmations#confirm", :as => :customer_confirm
    end
  
	root :to => "staticpages#home"

	resource :staticpages, :path => '' do 
		get 'dashboard'
    get 'calendar'
    get 'json_feed'
    get 'settings'
	end

  resources :customers do
  	resources :orders
    resources :measurements
    resources :appointments
  end

  resources :orders do
    resources :payments
  end

  resources :occasions
  resources :item_types

end
