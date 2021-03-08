require 'scraperwiki'
require 'mechanize'

url   = "https://eservices.ballarat.vic.gov.au/ePathway/Production/Web/Generalenquiry/enquirylists.aspx"
agent = Mechanize.new
page  = agent.get(url)

button = form.button_with(id: 'ctl00_MainBodyContent_mDataList_ctl06_mDataGrid_ctl02_ctl00')
form.click_button(button)

submit = form.button_with(id: 'ctl00_MainBodyContent_mContinueButton')
form.click_button(submit)

# page.search("div.item-list a").each do |a|
#   page.search("tr.odd, tr.even").each do |tr|
#     record = {
#       "council_reference" => tr.search("td")[1].inner_text.strip,
#       "address" => tr.search("td")[0].inner_text.strip + ", VIC",
#       "description" => tr.search("p")[0].inner_text.strip,
#       "info_url" => tr.search('a')[0].attributes['href'].to_s,
#       "comment_url" => "mailto:info@brimbank.vic.gov.au",
#       "date_scraped" => Date.today.to_s
#     }

#     puts "Saving record " + record['council_reference'] + " - " + record['address']
# #      puts record
#     ScraperWiki.save_sqlite(['council_reference'], record)
#   end
#   page = agent.get(url + a.attributes['href'].to_s)
# end

FileUtils.touch('data.sqlite')
