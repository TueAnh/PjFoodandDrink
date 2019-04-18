class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :reviews
  scope :order_created_at_desc, -> {order created_at: :desc}
  scope :category_by, -> (category){where category_id: category}
end
