Rails.application.routes.draw do
  root "import_sessions#index"

  resource :import_session, only: [:new, :index, :show]
end
