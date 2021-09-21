class AddParentDefaultOnComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :parent, type: :integer, foreign_key: { to_table: :comments }
  end
end
fe