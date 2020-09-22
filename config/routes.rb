Rails.application.routes.draw do

  resources :books do
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  devise_for :users
  devise_scope :user do
	  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show,:index,:edit,:update] do
    resources :relationships, only: [:create]
    delete "relationships" => "relationships#destroy"
    get 'relationships/follower' => 'relationships#followers'
    get 'relationships/follow' => 'relationships#followings'
  end

  root 'home#top'
  get 'home/about' => 'home#about'

end