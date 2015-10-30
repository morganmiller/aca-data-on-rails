Rails.application.routes.draw do
  
  resources :plans, only: [:index]

end
