class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :other_id

      t.timestamps
    end
  end
end
