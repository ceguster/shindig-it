Rails.application.routes.draw do

  root 'root#index'

  resources :users

  resources :events do
    resources :invitations
    resources :contributions
  end

end
