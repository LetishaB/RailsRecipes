class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      add_index :table_name, :column_name, unique: true

      t.timestamps
    end
  end
end
