class User < ApplicationRecord
  has_many :comments, class_name: "Comment", foreign_key: "user_id",
    dependent: :destroy
  has_many :commented_product, through: :comments, source: :product

  has_many :orders, foreign_key: "user_id", dependent: :destroy
end
