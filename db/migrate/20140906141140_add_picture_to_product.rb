class AddPictureToProduct < ActiveRecord::Migration
  def change
    add_reference :pictures, :product, index: true
  end
end
