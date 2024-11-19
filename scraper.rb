
require 'open-uri'
require 'nokogiri'

=begin
doc = Nokogiri::HTML(URI.open('https://www.bea.gov/data/prices-inflation/gdp-price-index'))
#doc = Nokogiri::HTML(open('http://www.google.com/search?q=doughnuts'))  # doesn't work
#doc = Nokogiri::HTML(URI.open('http://www.google.com/search?q=doughnuts'))
doc.xpath('//tr[@class="item-fact-row"]/td').each do |node|
  #doc.xpath('//a').each do |node|
  puts node.text
end

puts '-----'

doc = Nokogiri::HTML(URI.open('https://www.bea.gov/data/consumer-spending/main'))
#doc = Nokogiri::HTML(URI.open('https://www.bea.gov/data/gdp/gross-domestic-product'))

path = '//tr[@class="item-fact-row"]/td//div'
doc.xpath(path).each do |node|
  #doc.xpath('//a').each do |node|
  puts node.text
end


fruit_colors = { apple: 'red', lemon: 'yellow', lime: 'green' }
=end


def print_data(indicator)
  puts indicator

  doc = Nokogiri::HTML(URI.open(indicator[:url]))

  doc.xpath(indicator[:path]).each do |node|
     puts node.text
  end
end


indicators = [
  {
    name: 'gross-domestic-product',
    url: 'https://www.bea.gov/data/gdp/gross-domestic-product',
    path: '//tr[@class="item-fact-row"]/td/div'
  },
 {
    name: 'consumer-spending',
    url: 'https://www.bea.gov/data/consumer-spending/main',
    path: '//tr[@class="item-fact-row"]/td'
  },
  {
    name: 'gdp-price-index',
    url: 'https://www.bea.gov/data/prices-inflation/gdp-price-index',
    path: '//tr[@class="item-fact-row"]/td'
  }
]

indicators.each do |indicator|
  print_data(indicator)
end




=begin
url.each do |metric, url|
  puts "#{metric} - #{url}"

  doc = Nokogiri::HTML(URI.open(url))

  doc.xpath(path).each do |node|
    #doc.xpath('//a').each do |node|
    puts node.text
  end

end



<gdp>
https://www.bea.gov/data/gdp/gross-domestic-product

<consumer-spending>
https://www.bea.gov/data/consumer-spending/main
https://www.bea.gov/data/personal-consumption-expenditures-price-index
https://www.bea.gov/data/personal-consumption-expenditures-price-index-excluding-food-and-energy

<income-saving>
https://www.bea.gov/data/income-saving/personal-income
https://www.bea.gov/data/income-saving/disposable-personal-income
https://www.bea.gov/data/income-saving/personal-saving-rate
https://www.bea.gov/data/income-saving/corporate-profits
https://www.bea.gov/data/income-saving/gross-domestic-income

<intl-trade-investment>
https://www.bea.gov/data/intl-trade-investment/international-transactions
https://www.bea.gov/data/intl-trade-investment/international-trade-goods-and-services

<prices-inflation>
https://www.bea.gov/data/prices-inflation/gdp-price-index
https://www.bea.gov/data/prices-inflation/gdp-price-deflator
https://www.bea.gov/data/prices-inflation/gross-domestic-purchases-price-index
https://www.bea.gov/data/personal-consumption-expenditures-price-index
https://www.bea.gov/data/personal-consumption-expenditures-price-index-excluding-food-and-energy

<receipts-and-expenditures>
https://www.bea.gov/data/government/receipts-and-expenditures

=end

