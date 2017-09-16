Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  root 'book#index'
  get '/'=>'book#index'
  get '/new'=> 'book#new'
  get '/book/:id'=> 'book#show'
  post '/new'=> 'book#create'
  delete '/delete'=>'book#destroy'
  get '/search'=> 'book#search'
  get '/search_form'=>'book#search_form'
  get '/edit'=>'book#edit'
  post '/update'=>"book#update"
  post '/create_history'=> 'user_history#create_history'
  post '/new_integer_token'=> 'user_history#create_integer_token'
  post '/new_boolean_token'=> 'user_history#create_boolean_token'
  post '/change_integer'=> 'user_history#add'
  post '/change_boolean'=> 'user_history#change'
  post '/user_history/use_saves'=>'user_history#use_save'
  get '/user_page'=>'user_history#user_page'
  get '/edit_history'=> 'user_history#edit_history'
  post '/update_history'=>"user_history#update"
  delete '/delete_history'=> "user_history#delete_history"
  get '/delete_history'=>"user_history#delete_history"
  get '/start'=>"user_history#start"
  post '/start'=>"user_history#start"
  get '/start_book'=>"user_history#start_book"
  post '/start_book'=>"user_history#start_book"
  post '/update_bookmark'=>"user_history#update_bookmark"
  get '/update_bookmark'=>"user_history#update_bookmark"
  resources :user_profile do
    end
end
