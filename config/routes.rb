Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  get "questions" => "questions#index"
  get "questions/new" => "questions#new"
  post "questions" =>"questions#create"
  delete 'questions/:id' => "questions#destroy"
  patch 'questions/:id' => "questions#update"
  get 'questions/:id/edit' => 'questions#edit'
  get 'users/:id' => "users#show"
end
