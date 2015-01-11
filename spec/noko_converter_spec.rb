require "spec_helper"
require "noko_converter"
require "Business"
require "Nokogiri"
require "RestClient"

describe NokoConverter do
	let(:source) {"http://www.yelp.com/biz/fat-angel-san-francisco"}

	it "convert page" do
		noko = NokoConverter.new(source)
		biz = noko.to_biz
		expect(biz.name).to include "Fat Angel"
	end

	it "gets related biz name" do
		noko = NokoConverter.new(source)
		biz = noko.to_biz
		r_biz = NokoConverter.new(biz.related[0])
		r_biz = r_biz.to_biz
		expect(r_biz.name).to eq "The Social Study"
	end

	it "returns reviews (40) from page" do
		noko = NokoConverter.new(source)
		reviews = noko.reviews
		expect(reviews.count).to be 40
	end
end
