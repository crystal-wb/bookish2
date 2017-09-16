class UserProfileController < ApplicationController
    
    def index
        @family=User.all
    end
    
    def new
    end
    
    def create
        profile=current_user
        profile.username=params['username']
        profile.about=params['about']
        profile.hobbies=params['hobbies']
        profile.avatar=params['avatar']
        profile.save
      redirect_to '/user_page'
    end
    
    def edit
    end

    
    def update
        profile=current_user
        profile.username=params['username']
        profile.about=params['about']
        profile.hobbies=params['hobbies']
        profile.avatar=params['avatar']
        profile.save
      redirect_to '/user_page'
    end
    
    def show
        @rel=User.find(params['id'])
    end
    def delete
    end
end
