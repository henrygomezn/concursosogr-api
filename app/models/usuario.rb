class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :rol
  has_many:competidors, dependent: :destroy
  VALID_RUT_REGEX = /\A\d{1,2}\.\d{3}\.\d{3}[-][0-9kK]{1}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :correo, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: {minimum: 6}
  validates :rut, format: { with: VALID_RUT_REGEX }, uniqueness: true
end
