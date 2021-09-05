class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.datetime :created_at
      t.datetime :update_at
      t.integer :review_id

      t.timestamps
    end
  end
end
