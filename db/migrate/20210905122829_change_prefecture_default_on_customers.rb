class ChangePrefectureDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :prefecture, :prefectures
  end
end
