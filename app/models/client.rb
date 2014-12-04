class Client < ActiveRecord::Base
  belongs_to :user

  has_many :action_plans
  has_many :text_messages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, format: { with: /\A\+1\d{10}\z/,
    message: "number format is +1 followed by the rest of the phone number. Example: +14152823334"}
  validates :salesforce_id, length: { minimum: 15, message: "ID is too short, if you do not wish to enter a Salesforce ID then simply enter a random sequence e.g. '123456789123456'" }
  validates :contact_id, presence: true, length: { minimum: 7 }
end
