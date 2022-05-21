class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.integer :rating
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
