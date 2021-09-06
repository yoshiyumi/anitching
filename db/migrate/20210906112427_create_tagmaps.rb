class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.integer :tag_id
      t.integer :work_id
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
