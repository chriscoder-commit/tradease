Rails.application.routes.draw do
  root to: "listings#index"

  resources :listings do
    resources :comments, only: [:new, :create, :destroy]
  end 
  resources :tradesmen
  resources :profiles do 
    member do
      get "profile_listings"
      end 
    end
  resources :reviews, only: [:new, :create, :destroy]
  


  

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
