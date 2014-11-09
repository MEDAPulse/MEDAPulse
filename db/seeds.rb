# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Client.create!(user_id: '1234', first_name: 'Lance', last_name: 'Armstrong', phone: '+11234567890', salesforce_id: '0987', email: 'lance@gmail.com')
    Client.create!(user_id: '1235', first_name: 'Brittany', last_name: 'Martin', phone: '+11234567891', salesforce_id: '0986', email: 'brittany@ninefold.com')
    Client.create!(user_id: '1236', first_name: 'Angelo', last_name: 'Livanos', phone: '+11234567892', salesforce_id: '0985', email: 'risa@ninefold.com')
    Client.create!(user_id: '1237', first_name: 'Risa', last_name: 'Batta', phone: '+11234567893', salesforce_id: '0984', email: 'angelo@ninefold.com')
    Client.create!(user_id: '1238', first_name: 'Eden', last_name: 'Halil', phone: '+11234567894', salesforce_id: '0983', email: 'edenhalil@gmail.com')
#    Client.create(user_id: '', first_name: '', last_name: '', phone: '', salesforce_id: '', email: '')