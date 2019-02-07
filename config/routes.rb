Rails.application.routes.draw do
  root 'pages#main'

  get 'user/unsubscribe', to: 'users#unsubscribe', as: :user_unsubscribe

  defaults format: :json do
    resource :registration, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end
