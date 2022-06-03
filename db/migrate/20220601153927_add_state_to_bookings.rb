class AddStateToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :state, :string
  end
end
