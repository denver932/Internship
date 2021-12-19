Rails.application.routes.draw do
  resources :patients do
    get "patients" => "patients#index", as: "patients"
  end
  resources :physicians do
    get "physicians" => "physicians#index" , as: "physicians"
  end
end
