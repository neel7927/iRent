class RemoveIsAcceptedFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :is_accepted, :boolean
  end
end
