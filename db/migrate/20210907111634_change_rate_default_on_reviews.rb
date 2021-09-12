class ChangeRateDefaultOnReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :float, null: false, default: 0
  end
end
