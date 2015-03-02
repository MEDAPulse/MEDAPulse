Feature: Pulse Sign In
	In order to use Pulse to track my clients
	As an existing coach
	I want to be able to view my clients

	Scenario: Coach can view clients
	  When I sign in with valid credentials
		And have several clients
		Then I should see my list of clients

	Scenario: Coach can view clients
	  When I sign in with valid credentials
		And have several clients
		And delete one client
		Then that clients should be removed from my list of clients



	
	
	