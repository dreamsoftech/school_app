DigestTeamMailer::Application.routes.draw do
  get "member/new"

  get "member/create"

  get "member/edit"

  get "member/update"

  get "member/destroy"

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
  
  resources :users

  # post '/create-digests', :to => 'digests#create', :as => 'create_digest'
end