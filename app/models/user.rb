class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 1..128

  enum role: {member: 100, admin: 200}
  ransacker :role, formatter: proc {|v| roles[v]}

  has_one :user_travel_agent
  has_many :visitors
  has_many :orders

  def auth_token
    [id, Digest::MD5.hexdigest(encrypted_password)].join(":")
  end
end
