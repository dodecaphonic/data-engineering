Rails.application.routes.draw do
  root "import_sessions#index"

  resources :import_sessions, only: [:index, :show, :create]
end
