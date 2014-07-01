Rails.application.routes.draw do
  resources :wanteds

  get "/listings-dashboard", to: "listings#dashboard", as: :listings_dashboard
  get "/buy-sell", to: "listings#buy_sell", as: :buy_sell

  resources :listing_areas

  devise_for :users
end
