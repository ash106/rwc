Rails.application.routes.draw do
  resources :listing_areas

  devise_for :users
end
