require "spec_helper"
require "noko_converter"
require "business"
require "review"
require "Nokogiri"
require "RestClient"

describe Review do
  let(:source) {"http://www.yelp.com/biz/fat-angel-san-francisco"}
  it "has author" do
    page = NokoConverter.new(source)
    reviews = page.reviews
    review = Review.new(reviews[0])
    expect(review.author).to eq "Stephanie F."
  end

  it "has date" do
    page = NokoConverter.new(source)
    reviews = page.reviews
    review = Review.new(reviews[0])
    expect(review.date).to eq "12/27/2014"
  end

  it "has stars" do
    page = NokoConverter.new(source)
    reviews = page.reviews
    review = Review.new(reviews[0])
    expect(review.stars).to eq "5.0"
  end
end
