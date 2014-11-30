def create_coach_with_clients
  @coach = FactoryGirl.create(:user_with_clients)
  # @user.clients.each { |client| puts client.to_yaml }
end

When(/^create several clients$/) do
  create_coach_with_clients
end

Then(/^I should see my list of clients\.$/) do
  @clients = @coach.clients
  expect(current_path).to eq("/clients")
  expect(@clients.count).to eq(5)
end