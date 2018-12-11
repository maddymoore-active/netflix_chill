class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
