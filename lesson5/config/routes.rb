Rails.application.routes.draw do
  devise_for :users
  root 'appointments#index'
  resources :patients
  resources :physicians
  resources :appointments
  resources :diagnosis_items
end
