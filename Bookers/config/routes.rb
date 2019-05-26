Rails.application.routes.draw do
  
  devise_for :users
  root to: 'home#top'
   get 'home/about', to: 'home#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users,only:[:show,:edit,:update,:index,:create]

end
