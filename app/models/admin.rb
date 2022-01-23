class Admin < ApplicationRecord
  has_secure_password
  before_commit :set_user_id
  has_many :users

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 6 }
  validates :email, presence: true, length: { maximum: 255},
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: true }
end
