class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 1..128

  enum role: {member: 100, admin: 200}
  ransacker :role, formatter: proc {|v| roles[v]}
end
