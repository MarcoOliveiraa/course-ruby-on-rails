Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show]
    resources :admins, except: [:show] 
    resources :diagrams, only: [:index] 
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :new, :create, :edit, :update]
    end

    resources :ad_detail, only: [:show]
    resources :categories, only: [:show]
    resources :comments, only: [:create]
  end

  devise_for :admins
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }
  
 
  root 'site/home#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
