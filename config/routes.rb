Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/show'
#客
  devise_for :customers, :controllers => {
  	:registrations => 'customers/registrations',
  	:sessions => 'customers/sessions',
  	:passwords => 'customers/passwords'
  }
#店主
  devise_for :owners, :controllers => {
  	:registrations => 'owners/registrations',
  	:sessions => 'owners/sessions',
  	:passwords => 'owners/passwords'
  }

#紹介
	resources :introductions
# message
  resources :owner_message, only: [:new, :index, :destroy, :create]
  resources :customer_message, only: [:new, :index, :destroy, :create]
  resources :posts, only: [:new, :show, :update, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end