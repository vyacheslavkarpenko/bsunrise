Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'pages/home'
      resources :users do
        resources :tasks
      end
    end
  end  
  root to: 'api/v1/pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
