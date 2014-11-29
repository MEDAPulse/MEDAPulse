FactoryGirl.define do
 
  factory :user do
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    email       Faker::Internet.email
    title       ['Financial Capability', 'Homeownership', 'Workforce', 'SparkPoint', 'Other'].sample
    password    "panda!b3@rs"
    password_confirmation "panda!b3@rs"
  end

end