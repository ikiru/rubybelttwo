Rails.application.routes.draw do

  get 'products' => 'products#index'
  post 'products' => 'products#create'
  put 'products/:id' => 'products#purchased'
  delete 'products/:id' => 'products#destroy'

  #########    Users    #############

root 'users#index'

post 'users' => 'users#create'
get 'users/:id' => 'users#show'

  #########  Sessions   ############

post 'sessions' => 'sessions#create'
delete 'sessions/:id' => 'sessions#destroy'


  ########  Dashboard  ############

get 'dashboard'  => 'dashboards#index'
post 'dashboard' => 'dashboards#create'


########  login ###########

delete 'logout' => 'sessions#destroy'
end
