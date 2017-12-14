class Comment < ApplicationRecord
  belongs_to :comment_user, class_name: "User"
  belongs_to :comment_product, class_name: "Product"

  validates :comment_user_id, presence: true
  validates :comment_product_id, presence: true
end
