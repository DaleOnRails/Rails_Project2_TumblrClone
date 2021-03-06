Rails.application.routes.draw do
  devise_for :users
  # this loop will nest will nests the comment route inside of the posts route because comments belong #to posts!
  resources :posts do
    resources :comments
  end
  #posts controller # index action. This route comes from 'rake routes'
  root "posts#index"

  #route for about page
  get "/about", to: "pages#about"
end
