class AddCoverPhotoToBooks < ActiveRecord::Migration[5.1]
  def change
    add_attachment :books, :cover_photo
  end
end
