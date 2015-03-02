Feature: Pulse Sign In
	As an existing coach
	I want to be able to manage my client's action plans.

	Scenario: Coach can create new client action plan
		When I visit a client's page
		And I create a new action plan
		Then I should see my client's new action plan

	Scenario: Coach can edit client action plan
		When I visit a client's page
		And I edit the client's action plan
		Then I should see the edited client action plan

	Scenario: Coach can view client action plan
		When I visit a client's page
		Then I should see a summary of my client's actions plans