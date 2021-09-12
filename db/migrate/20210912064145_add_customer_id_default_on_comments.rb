class AddCustomerIdDefaultOnComments < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :customer_id,:integer
  end
end
