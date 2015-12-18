Given(/^I have a vm at "(.*?)"$/) do |host|
  @host = host
  command = %W(up webserver)
  system 'vagrant', *command
  command = %W(provision webserver)
  expect (system 'vagrant', *command) == true
end

Then(/^I can log on as "(.*?)"$/) do |user|
  output=`ssh "#{user}@#{@host}" exit`
  expect $?.success? == true
end

When(/^I navigate to it$/) do
  visit "http://#{@host}"
end

Then(/^I see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
