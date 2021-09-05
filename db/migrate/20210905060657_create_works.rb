class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :image
      t.string :synopsis
      t.string :release_date
      t.integer :gernre_id
      t.integer :tag_id
      t.string :name
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
