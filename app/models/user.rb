class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_protected :is_admin,:encrypted_password
end
