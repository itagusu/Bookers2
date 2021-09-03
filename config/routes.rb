Rails.application.routes.draw do
  get 'searches/search'
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users do
   resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  get '/search' => 'searches#search'
  end

  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
