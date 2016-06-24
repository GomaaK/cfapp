require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product)
      @product.comments.create!(rating: 1, user: @user, body: "Terrible book!")
      @product.comments.create!(rating: 3, user: @user, body: "Good book!")
      @product.comments.create!(rating: 5, user: @user, body: "The best book!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when a product has no title" do

    let(:product) { Product.new(description: "Interesting book") }

    it "returns an invalid product message" do
      expect(product).not_to be_valid
    end
  end

end