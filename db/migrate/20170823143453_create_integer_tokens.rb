class CreateIntegerTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :integer_tokens do |t|
      t.string   :name
      t.integer  :value
      t.timestamps
    end
  end
end
