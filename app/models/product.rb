class Product < ApplicationRecord
  attr_accessor :image# tao bien binh thuong chua ma nhi phan 1 anh
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :reviews
  mount_uploader :image, ImageUploader
  scope :order_created_at_desc, -> {order created_at: :desc}
  scope :category_by, -> (category){where category_id: category}
end
