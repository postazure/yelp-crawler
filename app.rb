require_relative "./lib/noko_converter"
require_relative "./lib/crawler"
require_relative "./lib/Business"
require_relative "./lib/Review"
require "Nokogiri"
require "RestClient"


crawler = Crawler.new("http://www.yelp.com/biz/krispy-kreme-daly-city")
biz = crawler.health_score(100)
p biz.name
