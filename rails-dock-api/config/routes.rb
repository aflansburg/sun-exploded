Rails.application.routes.draw do
  get 'scenarios/new'
  post 'scenarios/create'
  get 'scenarios', to: 'scenarios#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
