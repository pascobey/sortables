Rails.application.routes.draw do
  root to: 'sortables#index'
  resources :columns, only: [:create, :delete]
  resources :sortables do
    member do
      patch :move
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
