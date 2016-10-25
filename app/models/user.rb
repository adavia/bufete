class User < ApplicationRecord
  has_many :tickets

  before_save do
    self.username = username.downcase
    self.email = email.downcase
  end

  validates :username, presence: true, length: { minimum: 6, maximum: 20 },
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
