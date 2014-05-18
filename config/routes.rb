Mybus::Application.routes.draw do
  devise_for :users


  # namespace 'website' do
  #   root :to => 'home#index'
  # end

  root :to => 'website/home#index'
  get "search" => 'website/home#search'
  get "dashboards",       to: "dashboards#index"
  resources :buses
  resources :brands
  resources :tenants
  resources :stations
  resources :drivers
  resources :customers
  resources :tickets
  resources :ticket_types
  resources :bus_trips
  resources :bus_movements
  resources :services
  resources :bus_services

end
