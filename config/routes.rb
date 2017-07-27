Rails.application.routes.draw do
  get '/wrm-dashboard(/:user_id)', to: 'water_rights_management#dashboard', as: :wrm_dashboard
  get '/show-water-rights', to: 'water_rights_management#show_water_rights', as: :show_water_rights
  get "/get-water-rights-data/:id(.:format)", to: "water_rights_management#get_data", as: :get_water_rights_data

  resources :water_rights
  resources :point_of_diversions
  resources :place_of_use_areas
  resources :for_sales
  resources :wanteds

  post '/place_of_use_area_water_rights(.:format)', to: 'place_of_use_area_water_rights#create', as: :place_of_use_area_water_rights
  delete '/place_of_use_area_water_rights(.:format)', to: 'place_of_use_area_water_rights#destroy', as: :place_of_use_area_water_right
  post '/point_of_diversion_water_rights(.:format)', to: 'point_of_diversion_water_rights#create', as: :point_of_diversion_water_rights
  delete '/point_of_diversion_water_rights(.:format)', to: 'point_of_diversion_water_rights#destroy', as: :point_of_diversion_water_right

  get "/listings-dashboard", to: "listings#dashboard", as: :listings_dashboard
  get "/buy-sell", to: "listings#buy_sell", as: :buy_sell
  get "/get-listings-data", to: "listings#get_data", as: :get_listings_data

  # get "/contact", to: "static_pages#contact", as: :contact

  resources :listing_areas

  devise_for :users

  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unprocessable_entity", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
