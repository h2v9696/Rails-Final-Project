class User < ApplicationRecord
  has_many :comments, class_name: "Comment", foreign_key: "comment_user_id",
    dependent: :destroy
  has_many :commented_product, through: :comments, source: :comment_product

  has_many :orders, foreign_key: "order_user_id", dependent: :destroy
end
