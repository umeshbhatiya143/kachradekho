class Product < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :commenting_users, through: :comments, source: :user
	has_many :likes
	has_many :liking_users, through: :likes, source: :user, conditions: { likes: { like_type: 'like' } }
	has_many :disliking_users, through: :likes, source: :user, conditions: { likes: { like_type: 'dislike' } }
	has_many_attached :images
    # has_many :product_images, dependent: :destroy
    validates :description, presence: true
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    validates :address, presence: true
end
