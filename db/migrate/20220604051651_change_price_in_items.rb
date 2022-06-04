class ChangePriceInItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :price, :integer
  end
end
