Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  resources :categories
  resources :operations do
    resources :payment_parts, only: [:create, :destroy]
  end
  resources :payment_parts
  resources :operation_history, only: [:create, :new]
  resources :label_filters, only: [:create, :destroy]
  post 'operation_history/parse', to: 'operation_history#parse'
  get 'delete_all_operations', to: 'operations#delete_all_operations'
  resources :budget_plans, only: [:create, :index, :new] do
    resources :budget_incomes, only: [:create, :destroy, :update]
    resources :budget_spendings, only: [:create, :destroy, :update]
  end
end
