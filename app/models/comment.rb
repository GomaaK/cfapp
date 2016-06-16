class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

	validates :body, length: {
    minimum: 3,
    maximum: 50
  }
	validates :user, presence: true
	validates :product, presence: true
	validates :rating, numericality: { only_integer: true }
end