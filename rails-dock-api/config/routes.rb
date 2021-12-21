Rails.application.routes.draw do
  get 'scenarios/new'
  post 'scenarios/create'
  get 'scenarios', to: 'scenarios#index'

  # will eventually create belongs_to scenarios->users
  get 'users/admin', to: 'users#admin'
  resources :users
end
