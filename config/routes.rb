Rails.application.routes.draw do
  root :to => 'welcome#index'

  devise_for :users, :path_prefix => 'api/v1', :skip => [:sessions, :registrations, :passwords]

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'login' => 'sessions#create', :as => :login
        delete 'logout' => 'sessions#destroy', :as => :logout
        post 'register' => 'registrations#create', :as => :register
        delete 'delete_account' => 'registrations#destroy', :as => :delete_account
      end

      get 'greetings', to: 'greetings#index', as: 'greetings'
    end
  end
end
