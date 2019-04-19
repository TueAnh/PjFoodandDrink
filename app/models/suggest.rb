class Suggest < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :accepted, :refused]
end
