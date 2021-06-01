Rails.application.routes.draw do

 root "home#top"
  
  get "users/:id/likes" => "users#likes"
  post "likes/:yoyo_id/destroy" => "likes#destroy"
  post "likes/:yoyo_id/create" => "likes#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/:id/" => "users#show"
  get "yoyos/index" => "yoyos#index"
  get "yoyos/search" => "yoyos#search"
  get "users/show"
  get "yoyos/sell" => "yoyos#sell"
  get "yoyos/:id" => "yoyos#show"
  get "signup" => "users#new"
  


  post "yoyos/create" => "yoyos#create"
  get "yoyos/:id/edit" => "yoyos#edit"
  post "yoyos/:id/update" => "yoyos#update"
  post "yoyos/:id/destroy" => "yoyos#destroy"
  post "users/create" => "users#create"

  get "/" => "home#top"
  get "about" => "home#about"

end
