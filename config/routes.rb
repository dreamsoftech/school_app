DigestTeamMailer::Application.routes.draw do
  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :groups
    resources :members
  resources :members
  resources :users
  resources :activitys
  resources :schedules
  resources :settings
  resources :emails
  resources :widgets

end