Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/articles', to: 'articles#index'
  root 'articles#index'
    #get '/articles', to: 'articles#index'
    #get '/articles/new', to: 'articles#new', as: :new_article
    #get '/articles/:id', to: 'articles#show', as: :article
    #post '/articles', to: 'articles#create'
    #get '/articles/:id/edit', to: 'articles#edit', as: :edit_article
    #patch '/articles/:id', to: 'articles#update'
    #delete '/articles/:id', to: 'articles#destroy'
  # Lines 5-11 can be replaced with the line 14 below
  resources :articles do
    resources :comments
  end 
end
