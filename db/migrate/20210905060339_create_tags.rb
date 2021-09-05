class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
