Rails.application.routes.draw do

  devise_for :users
 
  root 'root#index'
  
  resources :events do
    resources :invitations
    resources :contributions
  end

end
