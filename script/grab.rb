#ruby script/grab.rb "http://yahoo.com" "tmp"
require 'nokogiri'
require 'open-uri'

ARGV[0] ? url = ARGV[0] : url = "http://lezgro.com"
ARGV[1] ? dir = ARGV[1] : dir = "tmp"

doc = Nokogiri::HTML(open(url))
doc.traverse do |el|
  [el[:src], el[:href]].grep(/\.(gif|jpg|png)$/i).map{|l| URI.join(url, l).to_s}.each do |link|
    open("/#{dir}/#{link.split("/").last}", 'wb') do |file|
      file << open(link).read
    end
    puts  link.split("/").last  
  end
end