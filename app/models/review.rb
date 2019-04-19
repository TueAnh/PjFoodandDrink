class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user
	scope :for_product, -> (product){where product_id: product}
end
