Rails.application.routes.draw do
  resources :book_clubs do
    resources :topics, except: [:index]
  end

  root 'welcome#index'
end
