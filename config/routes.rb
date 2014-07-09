Rails.application.routes.draw do
  get '/wrm-dashboard', to: 'water_rights_management#dashboard', as: :wrm_dashboard
  get '/show-water-rights', to: 'water_rights_management#show_water_rights', as: :show_water_rights
  get "/get-water-rights-data/:id(.:format)", to: "water_rights_management#get_data", as: :get_water_rights_data

  resources :water_rights
  resources :point_of_diversions
  resources :place_of_use_areas
  resources :for_sales
  resources :wanteds

  get "/listings-dashboard", to: "listings#dashboard", as: :listings_dashboard
  get "/buy-sell", to: "listings#buy_sell", as: :buy_sell
  get "/get-listings-data", to: "listings#get_data", as: :get_listings_data

  resources :listing_areas

  devise_for :users
end
