Feature: Pulse Sign Up
	In order to use Pulse to track my clients
	As a new coach
	I want to be able to sign up for Pulse

	Scenario: Coach can signup with valid information
	  When I sign up with valid credentials
	  Then I should see the message "Welcome! You have signed up successfully."

	Scenario: Coach cannot sign up without an email address
		When I sign up without an email address
		Then I should see the message "Email can't be blank"

	Scenario: Coach cannot sign up without a password
		When I sign up without any password
		Then I should see the message "Password can't be blank"
	
	Scenario: Coach cannot sign up without a password that is too short
		When I sign up with a password that is too short
		Then I should see the message "Password is too short (minimum is 8 characters)"

	Scenario: Coach cannot sign up without a password confirmation
		When I sign up without a password confirmation
		Then I should see the message "Password confirmation doesn't match Password"
	
	Scenario: Coach cannot sign up with a mismatched password combo
		When I sign up without a mismatched password combo
		Then I should see the message "Password confirmation doesn't match Password"




	
	
	