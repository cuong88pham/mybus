Mybus::Application.routes.draw do
  devise_for :users
  root :to => "dashboards#index"
  resources :buses
  resources :brands
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
