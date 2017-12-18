class User < ApplicationRecord
  has_many :comments, class_name: "Comment", foreign_key: "user_id",
    dependent: :destroy
  has_many :commented_product, through: :comments, source: :product

  has_many :orders, foreign_key: "user_id", dependent: :destroy

  before_save {email.downcase!}

  validates :first_name, presence: true, length: {minimum: 3, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 50}

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 500},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum:6}

  has_secure_password
end
