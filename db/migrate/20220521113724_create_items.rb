class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :category
      t.boolean :available
      t.string :item_condition
      t.integer :average_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
