Rails.application.routes.draw do
  root 'pages#index'

  get 'test/image'      => 'pages#image_test'      , :as => :image_test
  get 'test/javascript' => 'pages#javascript_test' , :as => :javascript_test
  get 'test/stylesheet' => 'pages#stylesheet_test' , :as => :stylesheet_test
end
