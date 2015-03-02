Feature: Pulse Sign In
	In order to use Pulse to track my clients
	As an existing coach
	I want to be able to manage my client information

	Scenario: Coach can add Client
	  When I sign in with valid credentials
		And I create a new client
		Then I should see that new client in my list of clients

	Scenario: Coach can edit Client
	  When I sign in with valid credentials
		And have several clients
		And I edit the client's details
		Then I should see an updated list of clients

	Scenario: Coach can view Client
	  When I sign in with valid credentials
		And have several clients
		Then I should see my list of clients

	@javascript
	Scenario: Coach can delete Client
	  When I sign in with valid credentials
		And have several clients
		And delete one client
		Then that clients should be removed from my list of clients



	
	
	