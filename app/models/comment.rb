class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

	validates :body, length: {
    minimum: 2,
    maximum: 50,
    too_short: "Your review must have at least %{count} characters",
    too_long: "Your review may not have more than %{count} characters"
  }
	validates :user, presence: true
	validates :product, presence: true
	validates :rating, numericality: { only_integer: true }
end
