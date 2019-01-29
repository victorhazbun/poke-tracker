Rails.application.routes.draw do
  root 'pages#main'

  defaults format: :json do
    resource :registration, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end
