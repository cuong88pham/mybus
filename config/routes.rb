Mybus::Application.routes.draw do
  devise_for :users
  root :to => "dashboards#index"
  resource :buses
end
