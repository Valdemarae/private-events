Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users
  resources :event_attendees, only: [:create, :destroy, :update]
  root to: "events#index"
end
