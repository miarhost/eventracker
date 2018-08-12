Rails.application.routes.draw do
  resource :eventracker, only: [:edit, :update]
end