Rails.application.routes.draw do
  resources :water_rights

  resources :point_of_diversions

  resources :place_of_use_areas

  resources :for_sales

  resources :wanteds

  get "/listings-dashboard", to: "listings#dashboard", as: :listings_dashboard
  get "/buy-sell", to: "listings#buy_sell", as: :buy_sell
  get "/get-listings-data", to: "listings#get_listings_data", as: :get_listings_data

  resources :listing_areas

  devise_for :users
end
