class Crawler
  def initialize(root_url)
    @root_url = root_url

  end

  def health_score(value)
    queue = [@root_url]
    viewed = []
    while !queue.empty?
      current_biz_url = queue.pop
      next if viewed.include?(current_biz_url)
      noko = NokoConverter.new(current_biz_url)
      current_biz = noko.to_biz
      puts "Expanding '#{current_biz.name}'"
      return current_biz if current_biz.health_score == value
      current_biz.related.each do |related_biz_url|
        queue.unshift(related_biz_url) unless related_biz_url.nil?
      end

    end

  end
end
