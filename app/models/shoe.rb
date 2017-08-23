class Shoe < ActiveRecord::Base
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User", required: true

  validates :product, presence: true, length: { in: 2..30 }
  validates :price, presence: true
end
