Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/signup',  		to: 'users#new'
  post   '/signup',  		to: 'users#create'
  get     '/login', 	    to: 'sessions#new'
  post    '/login', 	    to: 'sessions#create'
  delete '/logout',  		to: 'sessions#destroy'
  get    	'/check_reimbursements',   to: 'reimbursements#show'
  get    	'/home_reimbursements',    to: 'reimbursements#index' 
  post   	'/create_reimbursements',  to: 'reimbursements#create'  
  get    	'/new_reimbursements',     to: 'reimbursements#new' 
  delete    '/delete_reimbursements',  to: 'reimbursements#destroy' 
  resources :users, :reimbursements
end