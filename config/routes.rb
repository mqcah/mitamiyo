Rails.application.routes.draw do
	namespace :customer do
		resources :movies, shallow: true do
			resource :bookmarks, only: [:create, :destroy]
			get :bookmarks, on: :collection
		end
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
	patch 'customers/hide' => 'customer/customers#hide', as: 'hide'

	scope module: :customer do
	    resources :customers, only: [:show, :edit, :update, :index]
	    resources :movies, only: [:index, :create, :destroy, :update, :edit, :show, :new]
	end

	# 追加
    resources :customers do
      member do
        get :following, :followers
      end
    end
	resources :follow_relationships, only: [:create, :destroy]
	# ここまで
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
