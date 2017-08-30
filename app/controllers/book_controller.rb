class BookController < ApplicationController
    
    def home
        @library=Book.all
    end
    
    def create_book
      book=Book.new
      
      book.title=params['title']
      book.author=params['author']
      book.description=params['description']
      book.genre=params['genre']
      book.date=params['date']
      book.date=params['url']
      #book.image=params['image']
      #book.picture=params['picture']
      book.save
      #redirect_to page_path('home')
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
        #@book.picture=params['picture']
        
        @book.save
        redirect_to page_path('home')
    end
end
