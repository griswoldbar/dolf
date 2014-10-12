Then(/^I should see the following table:$/) do |expected_table|
  table = Nokogiri::HTML(page.body).css("table").map do |table|
    table.css("tr").map do |tr|
      tr.css('th, td').map do |td|
        td.text
      end
    end
  end[0]

  expected_table.diff!(table)
end