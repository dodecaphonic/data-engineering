Rails.application.routes.draw do
  devise_for :admins
  root "import_sessions#index"

  resources :import_sessions, only: [:index, :show, :create]
end
