class TextMessage < ActiveRecord::Base
  belongs_to :client, dependent: :destroy
end
