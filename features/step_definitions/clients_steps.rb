def create_coach_with_clients
  @coach = FactoryGirl.create(:confirmed_user_with_clients)
end

When(/^create several clients$/) do
  create_coach_with_clients
end

Then(/^I should see my list of clients\.$/) do
  @clients = @coach.clients
  expect(current_path).to eq("/clients")
  expect(@clients.count).to eq(5)
  # TODO Angular test - Seach existing clients should work.
  # TODO Angular test - 'Showing #n clients' should show the right number of clients.
  # TODO Angular test - Name, Email, Phone, MEDA Contact ID, and Salesforce ID columns should be filled with data.
end