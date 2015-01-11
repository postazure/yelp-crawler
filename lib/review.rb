class Review
  attr_reader :author
  def initialize(review)
    @review = review
    @author = extract_meta("author")


  end

  def date
    db_formated_date = extract_meta("datePublished").split("-")
    
    Time.new(
    db_formated_date[0],
    db_formated_date[1],
    db_formated_date[2]
    ).strftime("%m/%d/%Y")
  end
  private
  def extract_meta(property)
    @review.css("meta[itemprop='#{property}']").attr("content").value
  end
end
