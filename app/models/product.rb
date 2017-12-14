class Product < ApplicationRecord
  has_many :comments, class_name: "Comment", foreign_key: "comment_product_id",
    dependent: :destroy
  has_many :commented_user, through: :comments, source: :comment_user

  has_many :order_details, class_name: "OrderDetail", foreign_key: "detail_product_id",
    dependent: :destroy
  has_many :ordered, through: :order_details, source: :detail_order

  has_many :images, class_name: "ProductImage", foreign_key: "image_product_id",
    dependent: :destroy

  belongs_to :category, class_name: "ProductCategory"
end
