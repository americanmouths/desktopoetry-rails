class Category < ApplicationRecord
  has_many :poems
  belongs_to :user
end
