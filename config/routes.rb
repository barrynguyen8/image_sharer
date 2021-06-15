Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :pics #creates all the routes of the views files for CRUD actions
    
    root "pics#index"

end
