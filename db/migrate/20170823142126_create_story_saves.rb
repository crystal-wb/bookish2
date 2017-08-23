class CreateStorySaves < ActiveRecord::Migration[5.1]
  def change
    create_table :story_saves do |t|
      t.string    :name
      t.integer   :user_id
      t.integer   :book_id
      t.timestamps
    end
  end
end
