Mybus::Application.routes.draw do


  devise_for :users


  # namespace 'website' do
  #   root :to => 'home#index'
  # end

  root :to => 'website/home#index'

  get "search" => 'website/home#search'
  get "post/:id-:alias" => 'website/home#post', as: 'news'
  get "news" => 'website/home#news'
  get "contact" => 'website/home#contact'
  get "booking/:id" => 'website/home#booking'
  get "nganluong" => 'website/home#nganluong'
  post "make_booking" => 'website/home#make_booking'

  get "dashboards",       to: "dashboards#index"
  resources :buses
  resources :pos do
    get "booking/:id", on: :collection, to: 'pos#booking'
  end
  resources :reports
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
  resources :locations
  resources :posts
  resources :users do
    post 'create_user', on: :collection, to: 'users#create'
  end
end
