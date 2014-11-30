class User < ActiveRecord::Base
  has_many :clients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :title, presence: true
 
 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
end
