Rails.application.routes.draw do
  post '/eventracker' => 'redmine/app/projects#create', as: :eventtracker
  post '/eventracker' => 'redmine/app/projects#update', as: :eventtracker