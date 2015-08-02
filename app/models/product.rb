class Product < ActiveRecord::Base
  has_many :pictures
  belongs_to :category

  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :title, presence: true

  validates_associated :category

  scope :category_id, -> (category_id) { where category_id: category_id }
  scope :ordered_by_category, -> { joins(:category).order('categories.position ASC') }


  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end
end
