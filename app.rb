require_relative "./lib/noko_converter"
require_relative "./lib/crawler"
require_relative "./lib/Business"
require "Nokogiri"
require "RestClient"


crawler = Crawler.new("http://www.yelp.com/biz/fat-angel-san-francisco")
biz = crawler.health_score(90)
p biz.name
