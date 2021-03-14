class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :meal_type
      t.string :category
      t.decimal :serving
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
