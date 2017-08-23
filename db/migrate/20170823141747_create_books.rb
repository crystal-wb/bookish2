class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string    :title
      t.string    :description
      t.date      :date
      t.string    :author
      t.string    :genre
      t.string    :url
      t.timestamps
    end
  end
end
