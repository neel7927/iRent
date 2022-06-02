class RemoveDescriptionFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :description, :string
  end
end
