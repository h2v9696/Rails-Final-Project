class ProductImage < ApplicationRecord
  belongs_to :product, class_name: "Product"

  validates :image_product_id, presence: true
end
