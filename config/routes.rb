Rails.application.routes.draw do
  devise_for :users

  resources :book_clubs do
    resources :topics, except: :index
    resources :memberships, only: [:create, :destroy]
  end

  resources :topics, only: [] do
    resources :posts, except: :index
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  get 'dashboard' => 'dashboard#index'
  root 'welcome#index'
end
