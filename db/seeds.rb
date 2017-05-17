# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

url = 'http://1000mostcommonwords.com/1000-most-common-german-words/'
doc = Nokogiri::HTML(open(url))

table = doc.css('//tr')

table.each do |row|
  original = row.at_xpath('td[2]/text()').to_s
  translated = row.at_xpath('td[3]/text()').to_s
  Card.create(original_text: original,
              translated_text: translated)
end
