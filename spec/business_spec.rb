require "spec_helper"
require "noko_converter"
require "business"
require "Nokogiri"
require "RestClient"


describe Business do
  let(:source) {"http://www.yelp.com/biz/fat-angel-san-francisco"}

  it "name" do
    source_html = RestClient.get(source, user_agent: "Chrome")
    noko = Nokogiri::HTML(source_html)
    biz = Business.new(noko)
    biz_name = biz.name

    expect(biz_name).to eq "Fat Angel"
  end

  it "health_score" do
    source_html = RestClient.get(source, user_agent: "Chrome")
    noko = Nokogiri::HTML(source_html)
    biz = Business.new(noko)
    biz_health = biz.health_score
    expect(biz_health).to eq 98
  end

  it "related businesses" do
    source_html = RestClient.get(source, user_agent: "Chrome")
    noko = Nokogiri::HTML(source_html)
    biz = Business.new(noko)
    biz_related = biz.related
    expect(biz_related.count).to eq 3
  end

  it "related businesses are business" do
    source_html = RestClient.get(source, user_agent: "Chrome")
    noko = Nokogiri::HTML(source_html)
    biz = Business.new(noko)
    biz_related_url = biz.related
    expect(biz_related_url.first).to eq "http://www.yelp.com/biz/the-social-study-san-francisco?page_src=related_bizes"
  end

  it "related urls are valid" do
    source_html = RestClient.get(source, user_agent: "Chrome")
    noko = Nokogiri::HTML(source_html)
    biz = Business.new(noko)
    biz_related_url = biz.related.first

    related_source_html = RestClient.get(biz_related_url, user_agent: "Chrome")
    related_noko = Nokogiri::HTML(related_source_html)
    related_biz = Business.new(related_noko)
    related_biz_name = related_biz.name
    expect(related_biz_name).to eq "The Social Study"
  end
end
