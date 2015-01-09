require "spec_helper"
require "noko_converter"
require "crawler"
require "Business"
require "Nokogiri"
require "RestClient"


describe Crawler do
  let(:url) {"http://www.yelp.com/biz/fat-angel-san-francisco"}
  it "returns Rickybobby (HS 91)" do
    crawler = Crawler.new(url)
    hs_biz = crawler.health_score(91)
    expect(hs_biz.name).to eq "Rickybobby"
  end
end
