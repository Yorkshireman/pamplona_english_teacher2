class Material < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true
	validates :link, presence: true
	default_scope -> { order(created_at: :desc) }
end
