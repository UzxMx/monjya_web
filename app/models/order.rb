class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  serialize :visitors, JSON

  enum status: [:new_created, :paid, :cancelled_by_user]
end
