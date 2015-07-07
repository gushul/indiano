class ChangePriceToFloat < ActiveRecord::Migration
  def change
    change_column :products, :old_price, :float
    change_column :products, :price, :float
  end
end
