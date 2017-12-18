class User < ApplicationRecord
  attr_accessor :remember_token

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

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute :remember_digest, nil
  end
end
