class AddLocationFormattedAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_formatted_address, :string
  end
end
