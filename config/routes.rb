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

  get 'api/v1/user/:user_id/tasks/:parent_task_id', to: 'api/v1/tasks#new_subtask', as: 'new_subtask_api_v1_user_task'

  root to: 'api/v1/pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
