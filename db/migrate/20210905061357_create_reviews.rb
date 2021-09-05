class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :thoughts
      t.float :evaluation
      t.datetime :created_at
      t.datetime :update_at
      t.integer :customer_id
      t.integer :work_id

      t.timestamps
    end
  end
end
