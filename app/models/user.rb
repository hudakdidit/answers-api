class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password_digest
  has_many :questions
  has_many :answers, through: :questions, dependent: :destroy
end
