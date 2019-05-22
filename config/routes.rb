Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'

  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: %i[create]
  end
end
