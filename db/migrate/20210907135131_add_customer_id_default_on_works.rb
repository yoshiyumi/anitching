class AddCustomerIdDefaultOnWorks < ActiveRecord::Migration[5.2]
  def up
     add_column :works, :customer_id,:integer
  end
end
