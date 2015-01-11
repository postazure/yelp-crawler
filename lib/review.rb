class Review
  attr_reader :author, :db_date, :stars, :description
  def initialize(review)
    @review = review
    @author = extract_meta("author")
    @stars = extract_meta("ratingValue")
    @description = review.css("div.review-content > p").text

  end

  def date
    db_formated_date = extract_meta("datePublished").split("-")

    @db_date = Time.new(
    db_formated_date[0],
    db_formated_date[1],
    db_formated_date[2]
    )
    @db_date.strftime("%m/%d/%Y")
  end
  private
  def extract_meta(property)
    @review.css("meta[itemprop='#{property}']").attr("content").value
  end
end
