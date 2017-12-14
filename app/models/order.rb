class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details, class_name: "OrderDetail", foreign_key: "detail_order_id",
    dependent: :destroy
  has_many :ordered_product, through: :order_details, source: :detail_product
end
