# require 'open-uri'
#
# url = 'http://1000mostcommonwords.com/1000-most-common-german-words/'
# doc = Nokogiri::HTML(open(url))
#
# table = doc.css('//tr')
#
# table.each do |row|
#   original = row.at_xpath('td[2]/text()').to_s
#   translated = row.at_xpath('td[3]/text()').to_s
#   Card.create(original_text: original,
#               translated_text: translated)
# end


# date = 4.days.ago
# Card.create(original_text: 'eins', translated_text: 'one', review_date: date)
# Card.create(original_text: 'zwei', translated_text: 'two', review_date: date)
# Card.create(original_text: 'drei', translated_text: 'tree', review_date: date)
# Card.create(original_text: 'vier', translated_text: 'four', review_date: date)
# Card.create(original_text: 'fuenf', translated_text: 'five', review_date: date)
# Card.create(original_text: 'sechs', translated_text: 'six', review_date: date)
# Card.create(original_text: 'sieben', translated_text: 'seven', review_date: date)
# Card.create(original_text: 'acht', translated_text: 'eight', review_date: date)
# Card.create(original_text: 'neun', translated_text: 'nine', review_date: date)
# Card.create(original_text: 'zehn', translated_text: 'ten', review_date: date)
# Card.create(original_text: 'elf', translated_text: 'eleven', review_date: date)
# Card.create(original_text: 'zwoelf', translated_text: 'twelve', review_date: date)
