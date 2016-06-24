FactoryGirl.define do
  sequence(:title) { |n| "book title #{n}" }
  sequence(:author) { |n| "book author #{n}" }

  factory :product do
    title
    author
    description "A fun story"
    image_url "products/book_image.jpg"
    price 9.99
  end
end