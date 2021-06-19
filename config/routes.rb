Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pics do #creates all the routes of the views files for CRUD actions
    member do #nested route 
      put "like", to: "pics#upvote"
    end 
  end 
    
    root "pics#index"

end
