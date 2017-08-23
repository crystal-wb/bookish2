class CreateBooleanTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :boolean_tokens do |t|
      t.string   :name
      t.boolean  :value, default: false
      t.timestamps
    end
  end
end
