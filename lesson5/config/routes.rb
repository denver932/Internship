Rails.application.routes.draw do
  root "patients#index"
  resources :patients do
    get "patients" => "patients#index", as: "patients"
  end
  resources :physicians do
    get "physicians" => "physicians#index" , as: "physicians"
  end
  resources :appointments do
    get "appointments" => "appointments#index" , as: "appointments"
  end
  resources :diagnosis_items do
    get "diagnosis_items" => "diagnosis_items#index" , as: "diagnosis_items"
  end
end
