Rails.application.routes.draw do
  namespace :customer do
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
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
	    resources :movies, only: [:index, :create, :destroy, :update, :edit, :show, :new]
	end

	resources :movies, shallow: true do
	  resource :bookmarks, only: [:create, :destroy]
	  get :bookmarks, on: :collection
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
