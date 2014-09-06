class Product < ActiveRecord::Base

  has_many :pictures, foreign_key: "product_id"

  accepts_nested_attributes_for :pictures
end
