class Category < ActiveRecord::Base
   has_many :products

  validates :title, uniqueness: true

  def self.options_for_select
    order('LOWER(title)').map { |e| [e.title, e.id]  }
  end
end
