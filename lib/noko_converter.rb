class NokoConverter
	def initialize(url)
		@url = url
	end

	def to_biz
		source_html = RestClient.get(@url, user_agent: "Chrome")
		noko = Nokogiri::HTML(source_html)
		Business.new(noko)
	end
end
