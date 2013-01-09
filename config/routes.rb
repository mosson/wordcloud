Wordcloud::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  match '/auth/:provider/callback' => 'sessions#callback'
  match '/signin'    => 'sessions#index',   :as => :signin
  match "/signout"  => "sessions#destroy",  :as => :signout

  resources :themes, :except => %w(edit update) do
    resources :answers, :only => %w(index new create)
  end

  # static pages ::trick
  resources :pages, :except => %w(:show)

  root :to => "themes#index"

  # static pages ::trick
  get ':id', to: 'pages#show', :as => :page
end
