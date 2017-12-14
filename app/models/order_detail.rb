class OrderDetail < ApplicationRecord
  belongs_to :detail_order, class_name: "Order"
  belongs_to :detail_product, class_name: "Product"

  validates :detail_order_id, presence: true
  validates :detail_product_id, presence: true
end
