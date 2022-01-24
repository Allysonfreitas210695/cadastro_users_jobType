Rails.application.routes.draw do

  # Parte do admin
  get 'admin/new', to: 'admin#new'
  post 'admin/create', to: 'admin#create'
  get 'admin', to: 'admin#index'
  get 'admin/list', to: 'admin#lista_users'
  # secao para entrar e excluir a secao
  get 'session/entrar', to: 'sessions#entrar'
  post 'session/entrar', to: 'sessions#create'
  delete 'session/sair', to: 'sessions#destroy'


  # routas criadas com scaffold 7 seguindo o padrao REST
  resources :job_types, :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'welcome#index'
end
