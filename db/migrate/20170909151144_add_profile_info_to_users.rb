class AddProfileInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :avatar
    add_column :users, :about, :string, default: "I am a riddle, wrapped in a mystery, inside an enigma."
    add_column :users, :hobbies, :string, default: "I do stuff."
    add_column :users, :username, :string, default: "Nameless"
  end
end
