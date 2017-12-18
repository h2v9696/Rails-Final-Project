class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details, class_name: "OrderDetail", foreign_key: "order_id",
    dependent: :destroy
  has_many :ordered_product, through: :order_details, source: :product
end
