Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :diseases 
  resources :medical_conditions
  get '/get_medical_conditions', to:'diseases#get_medical_conditions'
  get '/get_medicines', to:'medical_conditions#get_medicines'
  get '/get_doses', to:'medicines#get_doses'
  get '/get_packs', to:'doses#get_packs'
  get '/show_addresses', to:'packs#show_addresses'
  get '/get_address', to:'packs#get_address'
  get '/select_payment_method', to:'packs#select_payment_method'
  get '/get_payment_method', to:'packs#get_payment_method'
  get 'medicines/:id/edit', to:'medicines#edit'
  get 'doses/:id/edit', to:'doses#edit'
  get 'packs/:id/edit', to:'packs#edit'
  resources :users, except: [:destroy,:new]
  resources :medicines
  resources :doses
  resources :packs
  resources :orders, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
