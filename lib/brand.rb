class Brand < ActiveRecord::Base
  has_many :procedures
  has_many :ingredients, through: :procedures
  has_many :measurements

  has_many :tags
  has_many :categories, through: :tags

  validates(:name, :presence => true)
end
