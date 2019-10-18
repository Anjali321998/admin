class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :requests_send,foreign_key: :sender_id, class_name: "Friend"
  has_many :requests_received,foreign_key: :receiver_id, class_name: "Friend"
  has_many :friends, foreign_key: :receiver_id
  has_many :friendships, -> { where(friends: {status: 'added'}) }, :through => :friends, source: :sender

  def requests
  	friends.where(status: :new_request)
  end
  
  #def friendships
  #	friends.where(status: :added)
  #end	
end
