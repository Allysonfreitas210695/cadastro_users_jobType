Rails.application.routes.draw do
  resources :job_types, :users
  
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  action: :index, controller: 'welcome'
end
