def create_coach
  @coach ||= FactoryGirl.build(:user)
end

def sign_up_coach
  visit new_user_registration_path

  fill_in "First name", with: @coach.first_name
  fill_in "Last name", with: @coach.last_name
  fill_in "Email", with: @coach.email

  select @coach[:title], from: "Title"

  fill_in "Password", with: @coach.password
  fill_in "Password confirmation", with: @coach.password_confirmation

  click_on "Sign up"
end

When(/^I sign up with valid credentials/) do
  create_coach
  sign_up_coach
end

When(/^I sign up without an email address/) do
  create_coach
  @coach.email = nil
  sign_up_coach
end

When(/^I sign up without any password/) do
  create_coach
  @coach.password = ''
  sign_up_coach
end

When(/^I sign up with a password that is too short$/) do
  create_coach
  @coach.password = @coach.password_confirmation = 'teehee!'
  sign_up_coach
end

When(/^I sign up without a password confirmation/) do
  create_coach
  @coach.password = 'heydiddlyhi'
  @coach.password_confirmation = ''
  sign_up_coach
end

When(/^I sign up without a mismatched password combo$/) do
  create_coach
  @coach.password = 'heydiddlyhi'
  @coach.password_confirmation = 'heydiddlyh1'
  sign_up_coach
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content( message )
end