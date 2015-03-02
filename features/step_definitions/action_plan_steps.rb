def create_client
  @client = FactoryGirl.create(:client, user: @coach)
end

def create_action_plan
  @action_plan = FactoryGirl.create(:action_plan, client: @client)
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
  @ap_desc = "Leap capital letters in a single bound"
  
  click_link "Create New Plan"
  fill_in "action_plan_description", with: @ap_desc
  click_button "Create action plan"
end

Then(/^I should see my client's new action plan$/) do
  expect(page).to have_content("Action plan: #{@ap_desc}")
end

When(/^I edit the client's action plan$/) do
  create_action_plan
  ap_id = @action_plan.id
  @new_ap_desc = "It's a word, it’s a plan..."
  
  visit client_path(@client) # Refresh page after creation of action plan
  find(:xpath, "//a[@href='/action_plans/#{ap_id}']").click
  find(:xpath, "//a[@href='/action_plans/#{ap_id}/edit']").click
  fill_in "action_plan_description", with: @new_ap_desc
  click_button "Save"
end

Then(/^I should see the edited client action plan$/) do
  expect(page).to have_content(@new_ap_desc)
end
