Rails.application.routes.draw do
  resources :topics
  resources :book_clubs
  
  root 'welcome#index'
end
