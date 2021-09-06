class ChangeGenreDefaultOnWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :gernre_id, :genre_id
  end
end
