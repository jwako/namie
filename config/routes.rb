Rails.application.routes.draw do
  get '/', to: 'top#show'
  resource :top, controller: :top, only: :show

  devise_for :users

end
