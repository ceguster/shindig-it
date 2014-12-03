Rails.application.routes.draw do

  root 'root#index'



  resources :events do
    resources :invitations
    resources :contributions
  end

end
