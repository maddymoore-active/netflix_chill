class AddLocationLatitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_latitude, :float
  end
end
