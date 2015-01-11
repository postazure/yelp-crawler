class NokoConverter
	def initialize(url)
		@url = url
	end

	def to_biz
		Business.new(converted_source)
	end

	def reviews
		converted_source.css("ul.reviews > li")
	end

	private
	def converted_source
		source_html = RestClient.get(@url, user_agent: "Chrome")
		Nokogiri::HTML(source_html)
	end
end
