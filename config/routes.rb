Rails.application.routes.draw do
  resources :posts
  resources :book_clubs do
    resources :topics, except: [:index]
  end

  root 'welcome#index'
end
