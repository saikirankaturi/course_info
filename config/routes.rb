Blog::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'articles/new_comment/:id', to: 'articles#new_comment', as: 'new_comment'
  post 'articles/save/:id', to: 'articles#save', as: 'save'

  resources :users
  resources :sessions
  resources :posts

  root to: 'articles#index'
  resources :articles
end
