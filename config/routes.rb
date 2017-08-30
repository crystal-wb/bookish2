Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  root 'book#home'
  get '/'=>'book#home'
  post '/new'=> 'book#create_book'
  get '/search'=> 'book#search'
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
end
