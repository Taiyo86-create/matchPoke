Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users do
    resources :matches do
      resource :messages
    end
  end
end
