class BookController < ApplicationController
    
    def index
        @library=Book.all
    end
    
    def new
    end
    
    def create
      book=Book.new
      
      book.title=params['title']
      book.author=params['author']
      book.description=params['description']
      book.genre=params['genre']
      book.date=params['date']
      book.url=params['url']
      #book.image=params['image']
      book.cover_photo=params['cover_photo']
      book.save
      redirect_to "/book/#{book.id}"
    end
    
    def show
        @book=Book.find(params['id'])
    end
    def search_form
    end
      
    def search
        title=params[:title]
        @books=Book.where("title like ?", "%#{title}%")
    end
      
    def edit
        @book=Book.find(params[:id])
    end
      
    def update
        @book=Book.find(params[:id])
        @book.title=params['title']
        @book.author=params['author']
        @book.description=params['description']
        @book.genre=params['genre']
        @book.date=params['date']
        @book.url=params['url']
        #@book.image=params['image']
        @book.cover_photo=params['cover_photo']
        
        @book.save
        redirect_to "/book/#{@book.id}"
    end
    
    def destroy
        book=Book.find(params[:id])
        book.destroy
        redirect_to "/"
    end
end
