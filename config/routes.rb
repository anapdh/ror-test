# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'contacts#index'

  resources :contacts do
    resources :properties
  end
end
