class ChangeImageDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :image, :image_id
  end
end
