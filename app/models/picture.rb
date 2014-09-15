class Picture < ActiveRecord::Base
  belongs_to :product, foreign_key: "product_id"
  mount_uploader :image, ImageUploader
end
