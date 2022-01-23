Rails.application.routes.draw do
  # routas criadas com scaffold 7 seguindo o padrao REST
  resources :job_types, :users

  # Parte do admin
  get 'admin/new', to: 'admin#new'
  post 'admin/create', to: 'admin#create'

  # sesão
  get 'session/entrar', to: 'sessions#entrar'
  post 'session/entrar', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'welcome#index'
end
