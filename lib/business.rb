class Business
  attr_reader :name, :health_score
  def initialize(noko)
    @noko = noko
    @name = extract_element("h1.biz-page-title")
    @health_score = extract_element("div.score-block").to_i
    @reviews = noko.css("ul.reviews > li")
  end

  def related
    related = @noko.css("div.related-businesses").css("ul.ylist > li")
    related.map {|item| "http://www.yelp.com" + item.css(".biz-name").attr("href").value}
  end

  def reviews
    noko_reviews = @noko.css("ul.reviews > li")
    reviews = []
    noko_reviews.each do |review|
      reviews.push(Review.new(review))
    end
    reviews
  end

  private
    def extract_element(key)
      @noko.css(key).text.strip
    end
end
