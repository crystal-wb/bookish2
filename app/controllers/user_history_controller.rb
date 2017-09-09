class UserHistoryController < ApplicationController
  
  def start
  end
        
  def create_history
      history=StorySave.find_by(name: params['name'], book_id: params['book_id'])
      if history.nil?
        history=StorySave.new
      end
      history.name=params['name']
      history.user_id=params['user_id']
      history.book_id=params['book_id']
      history.save
      session[:history_id] = history.id
      #redirect_to params['url']
      redirect_to page_path(params['url'])
  end
  
  def edit_history
        @story_save=StorySave.find(params[:id])
  end
  
  def update_bookmark
    @story_save=StorySave.find_by(id: session[:history_id])
    @story_save.bookmark=params['bookmark']
    @story_save.bookmark = @story_save.bookmark[1,@story_save.bookmark.length]
    if @story_save.save
    flash[:success] = "Bookmark saved"
  else
    flash[:error] = "Bookmark not saved"
    end
    redirect_to request.referer
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
   
   def start_book
    @story_save=StorySave.find(params[:id])
    @book=Book.find(@story_save.book_id)
    session[:history_id]=@story_save.id
    
    if @story_save.bookmark && @story_save.bookmark.length>0
      redirect_to page_path(@story_save.bookmark)
    else
      redirect_to page_path(@book.url)
    end
   end
  
  def create_boolean_token
    #@history=StorySave.find(params[:id])
    token=BooleanToken.find_by(name: params['name'], story_save_id: session[:history_id])
    if token.nil?
      token=BooleanToken.new
    end
    token.name=params['name']
    token.value=params['value']
    token.story_save_id=session[:history_id]
    #params['save_id']
    token.save
    redirect_to page_path(params['next_page'])
  end
  
  
  def create_integer_token
    #@history=StorySave.find(params[:id])
    token=IntegerToken.find_by(name: params['name'], story_save_id: session[:history_id])
    if token.nil?
      token=IntegerToken.new
    end
    token.name=params['name']
    token.value=params['value']
    token.story_save_id=session[:history_id]
    token.save
    redirect_to page_path(params['next_page'])
  end
  
  def add
    @token=IntegerToken.find_by(story_save_id: session[:history_id], name: params[:name])
    @token.value=@token.value + params['value'].to_i
    @token.save
    redirect_to page_path(params['next_page'])
  end
  
  def change
      @token=BooleanToken.find_by(story_save_id: session[:history_id], name: params[:name])
      @token.value=params['value']
      @token.save
      redirect_to page_path(params['next_page'])
  end
  
  def user_page
    @story_save = StorySave.all
   # @book=Book.where(id: @story_save.book_id)
  end
  
  
end
