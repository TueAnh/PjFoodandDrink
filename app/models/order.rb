class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  enum status: [:pending, :accept, :refuse]
  delegate :email, to: :user, prefix: "user", allow_nil: true
  delegate :username, to: :user, prefix: "user", allow_nil: true

  scope :order_created_at_desc, -> {order created_at: :desc}
end
