Rails.application.routes.draw do

	devise_for :customers, controllers: {
	    sessions: 'customers/sessions',
	    passwords: 'customers/passwords',
	    registrations: 'customers/registrations'
	  }

	# customer
	root 'homes#top'
	get 'homes/about' => 'homes#about', as: 'about'
	get 'customers/leave' => 'customer/customers#leave', as: 'leave'
	put "/users/:id/hide" => "users#hide", as: 'users_hide'

	scope module: :customer do
	    resources :customers, only: [:show, :edit, :update, :index]
	    resources :movie, only: [:index, :create, :destroy, :update, :edit, :show, :new]
	end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
