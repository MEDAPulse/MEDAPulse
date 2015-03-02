FactoryGirl.define do
  sequence :email do |n|
    "coach#{n}@medasf.org"
  end
  
  factory :coach_email do 
    text_message
    client
    user 
    email            { Faker::Internet.email }
    coach_firstname  { Faker::Name.first_name }
    client_firstname { Faker::Name.first_name }
    client_lastname  { Faker::Name.last_name }
    sentstatus       { [true, false].sample }
    content          { Faker::Hacker.say_something_smart }
  end
  
  factory :text_message do 
    client
    content          { Faker::Hacker.say_something_smart }
    incoming_message { [true, false].sample }
    scheduled_date   { Faker::Date.forward(30) }
    scheduled_time   { Faker::Time.forward(23).in_time_zone("Pacific Time (US & Canada)") }
    sentstatus       { [true, false].sample }        
    phone            { "+14127364161"  }
  end
  
  factory :step do
    goal
    description      { Faker::Company.catch_phrase }
    due_by           { Faker::Date.forward(30) }
    complete         { [true, false].sample }
  end
  
  factory :goal do
    action_plan
    description   { Faker::Lorem.sentence }
  end
  
  factory :action_plan do
    client
    description   { Faker::Hacker.adjective }
  end
  
  factory :client do
    user
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    phone         "+14085551212"
    email         { Faker::Internet.email }
    contact_id    { Faker::Number.number(8) }
    salesforce_id { Faker::Number.number(15) }
  end
 
  factory :user do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    email
    title       { ['Financial Capability', 'Homeownership', 'Workforce', 'SparkPoint', 'Other'].sample }
    password              "panda!b3@rs"
    password_confirmation "panda!b3@rs"
    
    factory :confirmed_user do
      after(:create) { |user| user.confirm! }
    end
    
    factory :confirmed_user_with_clients do
      transient do
        clients_count 5
      end

      after(:create) do |user, evaluator|
        user.confirm!
        create_list(:client, evaluator.clients_count, user: user)
      end
    end
  end
  


end