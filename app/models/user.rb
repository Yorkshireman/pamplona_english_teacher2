class User < ActiveRecord::Base
	authenticates_with_sorcery!

	validates :name, presence: true
	validates :password, length: { minimum: 4 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	has_many :testimonials
	has_many :materials
end
