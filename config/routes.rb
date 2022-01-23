Rails.application.routes.draw do
  resources :job_types, :users
  get 'admin/new', to: 'admin#new'
  post 'admin/create', to: 'admin#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'welcome#index'
end
