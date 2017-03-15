class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_and_belongs_to_many :sizes, uniq: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
end
