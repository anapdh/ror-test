Rails.application.routes.draw do
  resources :contacts do
    resources :properties, module: :contacts
  end

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "contacts#index"
end
