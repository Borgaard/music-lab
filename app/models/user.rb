class User < ActiveRecord::Base
	has_many :albums
	validates :username, presence: true
	validates :password, length: { within: 6..40 }
	has_secure_password
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
