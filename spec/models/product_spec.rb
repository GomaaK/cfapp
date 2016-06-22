require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(title: "Example Book", author: "John Doe", price: 10.00, image_url: "products/example_book.jpg")
      @user = User.create!(email: "example@user.com", password: "exampleuser1")
      @product.comments.create!(rating: 1, user: @user, body: "Terrible book!")
      @product.comments.create!(rating: 3, user: @user, body: "Good book!")
      @product.comments.create!(rating: 5, user: @user, body: "The best book!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when the product is not valid" do
    before do
      Product.new(description: "Interesting book")
    end

    it "returns an invalid product message" do
      expect(Product.new(description: "Interesting book")).not_to be_valid
    end
  end

end