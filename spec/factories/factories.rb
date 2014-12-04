FactoryGirl.define do
  sequence :email do |n|
    "coach#{n}@medasf.org"
  end
  
  factory :client do
    user
    first_name    Faker::Name.first_name
    last_name     Faker::Name.last_name
    phone         "+14085551212"
    email         Faker::Internet.email
    contact_id    Faker::Number.number(8)
    salesforce_id Faker::Number.number(15)
  end
 
  factory :user do
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    email
    title       ['Financial Capability', 'Homeownership', 'Workforce', 'SparkPoint', 'Other'].sample
    password              "panda!b3@rs"
    password_confirmation "panda!b3@rs"
    
    factory :user_with_clients do
      transient do
        clients_count 5
      end
      
      after(:create) do |user, evaluator|
        create_list(:client, evaluator.clients_count, user: user)
      end
    end
  end
  


end