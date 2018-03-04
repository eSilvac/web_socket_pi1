Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :messages, only: [:index] do
    post "send_message", on: :collection
  end
end
