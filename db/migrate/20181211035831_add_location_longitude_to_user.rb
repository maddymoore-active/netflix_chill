class AddLocationLongitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_longitude, :float
  end
end
