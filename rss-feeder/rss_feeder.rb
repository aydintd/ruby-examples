#!/usr/bin/env ruby

require 'feedjira'
require 'date'
require 'mail'

DATE = DateTime.now.strftime("%Y-%m-%d")

def get_rss
  urls = ['http://store.steampowered.com/feeds/news.xml','https://www.reddit.com/.xml']
  filename = "/opt/feed/feedfile-#{DATE}"
  feedfile = File.new(filename, 'w')
  urls.each do |url|
    feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.each do |entry|
      feedfile.puts("#{entry.title} : #{entry.url}")
      feedfile.write "\n"
    end
  end
  feedfile.close
  send_mail(filename)
end

def send_mail(filename)
  mail = Mail.new do
    content_type 'text/plain; charset=UTF-8'
    body File.read(filename) 
    from 'feed@aydintd.net'
    to 'aydintd@gmail.com'
    subject 'Steam RSS Feeds ' + "#{DATE}"
  end
  mail.deliver!
end

def main
  get_rss
end

if __FILE__ == $PROGRAM_NAME
  main
end
