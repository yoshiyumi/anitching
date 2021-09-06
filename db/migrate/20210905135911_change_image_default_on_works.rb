class ChangeImageDefaultOnWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :image, :image_id
  end
end
