class ChangeDataSynopsisToWork < ActiveRecord::Migration[5.2]
  def change
    change_column :works, :synopsis, :text
  end
end
