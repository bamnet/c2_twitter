class Twitter < DynamicContent

  def build_content
    require 'rss'
    require 'net/http'

    url = "http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=#{self.config['username']}"
    feed = Net::HTTP.get_response(URI.parse(url)).body

    rss = RSS::Parser.parse(feed, false, true)
    contents = []
    rss.items.each_with_index do |item, index|
      ticker = Ticker.new(
        :name => "#{rss.channel.title} (#{index+1})",
        :data => item.description,
      )
      contents << ticker
    end
    return contents
  end

end
