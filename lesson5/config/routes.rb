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
  resources :diagnosisitems do
    get "diagnosisItems" => "diagnosisitems#index" , as: "diagnosisitems"
  end
end
