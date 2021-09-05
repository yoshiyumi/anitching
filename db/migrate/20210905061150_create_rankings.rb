class CreateRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :rankings do |t|
      t.float :score
      t.integer :number
      t.float :point
      t.datetime :created_at
      t.datetime :update_at
      t.integer :work_id

      t.timestamps
    end
  end
end
