Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/signup',  		to: 'users#new'
  post   '/signup',  		to: 'users#create'
  get     '/login', 	    to: 'sessions#new'
  post    '/login', 	    to: 'sessions#create'
  delete '/logout',  		to: 'sessions#destroy'

  # resources :project
  
  resources :users do
    resources :reimbursements
    resources :allowances
    resources :dope_adjustments
    resources :nope_adjustments
    resources :payslips
  end

  resources :payrolls

  # , only: [:edit, :delete, :create, :update, :destroy, :new, :index]

  # resources :reimbursements

end