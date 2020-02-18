Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :json do

    resources :accounts do
      get :account_summary, on: :member
      resources :transactions, only: [:index]
    end

    resources :transactions, only: [:create]
  end
end
