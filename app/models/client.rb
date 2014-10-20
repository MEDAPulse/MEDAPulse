class Client < ActiveRecord::Base
  belongs_to :user
  has_many :action_plans
  has_many :text_messages
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates_format_of :phone, with: /\A\+1\d{10}\z/
  validates :salesforce_id, presence: true
end
