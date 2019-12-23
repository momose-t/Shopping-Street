Rails.application.routes.draw do
  get 'starts/about'
  get 'starts/concept'
  get 'starts/explain'
# トップページ
root to: 'stores#index'
# 投稿
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
  resources :stores do
    resources :posts, :only => [:new, :show, :create, :destroy]
  end
# メッセージ機能
  resources :conversations, :only => [:new, :index, :create, :show] do
    resources :messages, :only => [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end