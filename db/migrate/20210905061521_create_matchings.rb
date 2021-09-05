class CreateMatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :matchings do |t|
      t.integer :room_id
      t.integer :customer_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
