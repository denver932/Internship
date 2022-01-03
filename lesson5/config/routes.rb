Rails.application.routes.draw do
  root 'patients#index'
  resources :patients
  resources :physicians
  resources :appointments
  resources :diagnosis_items
end
