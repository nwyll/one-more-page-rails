Rails.application.routes.draw do
  resources :book_clubs do
    resources :topics, except: :index
  end

  resources :topics, only: [] do
    resources :posts, except: :index
  end

  resources :posts, only: [] do
    resources :comments, only: [:update, :create, :destroy]
  end

  root 'welcome#index'
end
