class Size < ApplicationRecord
  has_and_belongs_to_many :products, uniq: true
end
