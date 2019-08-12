class User < ApplicationRecord
  
  before_save { email.downcase! }  

  validates :name, presence: true, length: { maximum: 30 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 128 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true

end
