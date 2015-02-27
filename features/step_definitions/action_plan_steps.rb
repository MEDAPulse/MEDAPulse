def create_client
  @client = FactoryGirl.create(:client, user: @coach)
end

When(/^I visit a client's page$/) do
  create_coach
  sign_in
  create_client
  visit client_path(@client) 
  # TODO - Replace the line above with something that tests the client's name link via Angular.
end

Then(/^I should see a summary of my client's actions plans$/) do
  expect(current_path).to eq(client_path(@client))
  expect(page).to have_content("Action Plans")
end

When(/^I create a new action plan$/) do
  click_link "Create New Plan"
  expect(current_path).to eq(new_client_action_plan_path(@client))
  fill_in "action_plan_description", with: "hihihi"
  click_button "Create action plan"
end

Then(/^I should see my client's new action plan$/) do
  expect(page).to have_content("Action plan: hihihi")
end

When(/^I edit the client's action plan$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should the edited client action plan$/) do
  pending # express the regexp above with the code you wish you had
end
