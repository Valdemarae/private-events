Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users
  resources :event_attendees, only: [:create, :destroy, :update]
  resources :invitations, only: [:create, :new, :destroy]
  post 'invitation/accept', :to => 'invitations#accept'
  root to: "events#index"
end
