class ChangeEvaluationDefaultOnReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :evaluation, :rate
  end
end
