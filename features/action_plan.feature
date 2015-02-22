Feature: Pulse Sign In
	As an existing coach
	I want to be able to view a summary of my client's action plans, goals, and steps.

	Scenario: Coach can view client action plan
	  When I sign in with valid credentials
		And click on an individual client that has actions plans, goals, and steps
		Then I should see the summary of the client's action plans, goals, and steps
