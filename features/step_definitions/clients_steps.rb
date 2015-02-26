def create_coach_with_clients
  @coach = FactoryGirl.create(:confirmed_user_with_clients)
end

def create_client_goals
  @clients = @coach.clients
  @clients.each do |client|
    puts client.action_plans.to_yaml
  end
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

When(/^click on an individual client that has actions plans, goals, and steps$/) do
  create_coach_with_clients
  create_client_goals
end

Then(/^I should see the summary of the client's action plans, goals, and steps$/) do
  pending # express the regexp above with the code you wish you had
end