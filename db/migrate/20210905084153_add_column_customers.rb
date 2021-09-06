class AddColumnCustomers < ActiveRecord::Migration[5.0]
  def up
    add_column :customers, :nicname, :string
    
    add_column :customers, :image, :string
    
    add_column :customers, :prefecture, :string
    
    add_column :customers, :introduction, :string
    
    add_column :customers, :gender, :integer
    
    add_column :customers, :is_active,:boolean, default: true
  end
end
