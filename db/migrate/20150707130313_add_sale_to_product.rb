class AddSaleToProduct < ActiveRecord::Migration
  def change
    add_column :products, :old_price, :integer
    add_column :products, :price, :integer
    add_column :products, :sale, :boolean
  end
end
