Rails.application.routes.draw do

  devise_for :users
 
  root 'root#index'
  
  resources :profiles

  resources :events do
    resources :invitations
    resources :contributions
  end

  resources :recipes

end
