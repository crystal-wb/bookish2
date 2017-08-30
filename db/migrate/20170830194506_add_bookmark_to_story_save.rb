class AddBookmarkToStorySave < ActiveRecord::Migration[5.1]
  def change
    add_column :story_saves, :bookmark, :string
  end
end
