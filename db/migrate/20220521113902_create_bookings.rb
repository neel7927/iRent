class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.Date :start_date
      t.Date :end_date
      t.decimal :total
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
