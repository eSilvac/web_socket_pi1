Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  
  resources :messages, only: [:index] do
    get "send_page", on: :collection
    post "send_message", on: :collection
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [:create]
    end
  end
end
