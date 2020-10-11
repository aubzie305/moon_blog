Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
    #get '/articles', to: 'articles#index'
    #get '/articles/new', to: 'articles#new', as: :new_article
    #get '/articles/:id', to: 'articles#show', as: :article
    #post '/articles', to: 'articles#create'
    #get '/articles/:id/edit', to: 'articles#edit', as: :edit_article
    #patch '/articles/:id', to: 'articles#update'
    #delete '/articles/:id', to: 'articles#destroy'
    # The 7 lines above can be replaced with resources :articles
  devise_scope :user do
    post '/users/sign_up', to: 'devise/registrations#create', as: :new_user_reg
  end
  devise_for :users
  
  resources :moonies  
  resources :users 
  resources :articles, only: [:create, :destroy, :index]
  post '/articles', to: 'articles#create', as: :article_create

  resources :comments 
  post '/comments', to: 'comments#create', as: :comment_create

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/goodbye', to: 'static_pages#goodbye'
end
