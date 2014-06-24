Rails.application.routes.draw do

  get '/', to: 'top#show'
  resource :top, controller: :top, only: :show
  root :to => 'top#show'

  devise_for :users
  namespace :u do
    resource :home, controller: :home, only: :show
    get 'request' => 'request#index'
    post 'request_complete' => 'request#complete'
    get 'request_thanks' => 'request#thanks'
    get 'work/:url_token' => 'work#index', :as => :work
    get 'work/:url_token/complete' => 'work#complete', :as => :work_complete
    get 'work/:url_token/thanks' => 'work#thanks', :as => :work_thanks
    patch 'work/:url_token/thanks' => 'work#thanks', :as => :work_thanks_post
  end

  devise_for :supporters
  namespace :s do
    resource :home, controller: :home, only: :show
    resource :profiles, only: [:edit, :update]
    resources :work, only: :show
  end

  namespace 'api', :module => 'api' do
    get 'supporter_list' => 'supporter#list'
  end
end
