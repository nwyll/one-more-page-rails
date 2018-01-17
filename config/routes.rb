Rails.application.routes.draw do
  resources :book_clubs
  
  root 'welcome#index'
end
