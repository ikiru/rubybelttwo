Rails.application.routes.draw do

  #########    Users    #############

  root 'users#index'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'

  #########  Sessions   ############

  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'


  ########  Dashboard  ############

  get 'dashboard'  => 'dashboards#index'


########  login and out ############



end
