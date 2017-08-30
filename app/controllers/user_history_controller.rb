class UserHistoryController < ApplicationController
  
  def create_history
      history=StorySave.new
      history.name=params['name']
      history.user_id=User.find_by(email: params['email']).id
      history.book_id=params['book_id']
      history.save
      session[:history_id] = history.id
      redirect_to params['url']
      #redirect_to page_path('sarah/hello')
  end
  
  def edit_history
        @story_save=StorySave.find(params[:id])
  end
  
  def update
    @story_save=StorySave.find(params[:id])
    
    @story_save.name=params['name']
    @story_save.book_id=params['book_id']
    @story_save.user_id=params['user_id']
    @story_save.bookmark=params['bookmark']
    @story_save.save
    redirect_to params['url']
  end
  
   def delete_history
        @story_save=StorySave.find(params[:id])
        @story_save.destroy
        redirect_to '/user_page'
   end
  
  def create_boolean_token
    #@history=StorySave.find(params[:id])
    token=BooleanToken.new
    token.name=params['name']
    token.value=params['value']
    token.story_save_id=params['save_id']
    token.save
    redirect_to params['url']
  end
  
  
  def create_integer_token
    #@history=StorySave.find(params[:id])
    token=IntegerToken.new
    token.name=params['name']
    token.value=params['value']
    token.story_save_id=session[:history_id]
    byebug
    token.save
    redirect_to params['url']
  end
  
  def add
    @token=IntegerToken.find_by(params[:name])
    @token.value=@token.value + params['value']
    @token.save
  end
  
  def change
      @token=BooleanToken.find_by(params[:name])
      @token.value=params['value']
      @token.save
  end
  
  def user_page
    @story_save = StorySave.all
   # @book=Book.where(id: @story_save.book_id)
  end
end
