Rails.application.routes.draw do
  resources :posts
  #posts controller # index action. This route comes from 'rake routes'
  root "posts#index"
end
