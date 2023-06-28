require "open-uri"
require "nokogiri"

url = "https://tibia.fandom.com/wiki/Item_IDs"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)
array = []
html_doc.search("td a").each do |element|
  array << {
    name: element.text.strip,
    url: "https://tibia.fandom.com#{element['href']}"
  }
end

array.delete_at(-1)
array.delete_at(-1)
array.delete_at(-1)
array.delete_at(-1)
puts array

# doc = html_doc.search("td a")
# puts doc[0]['href']
