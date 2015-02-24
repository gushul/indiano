class AddLongToProduct < ActiveRecord::Migration
  def change
    add_column :products, :long, :string
  end
end
