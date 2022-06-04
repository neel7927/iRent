class ChangeStateinBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :state, from: nil, to: 'Pending'
  end
end
