def create_coach
  @coach = FactoryGirl.create(:confirmed_user)
end

def create_clients
  @clients = (0..4).map{ FactoryGirl.create(:client, user: @coach) }
end

When(/^have several clients$/) do
  create_coach
  create_clients
end

Then(/^I should see my list of clients$/) do
  expect(current_path).to eq("/clients")
  expect(@clients.count).to eq(5)
  # TODO Angular test - Seach existing clients should work.
  # TODO Angular test - 'Showing #n clients' should show the right number of clients.
  # TODO Angular test - Name, Email, Phone, MEDA Contact ID, and Salesforce ID columns should be filled with data.
end

When(/^delete one client$/) do
  client = @clients.sample
  visit client_path(client)
  click_link("Delete Client")
  # TODO - Use a different web driver to click ok for confirmation pop-up
  # click_button("OK")
end

Then(/^that clients should be removed from my list of clients$/) do
  # TODO - change eq(5) to eq(4) after new web driver installed.
  expect(@clients.count).to eq(5)
end