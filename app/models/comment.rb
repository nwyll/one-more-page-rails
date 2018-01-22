class Comment < ApplicationRecord
  belongs_to :post

  validates :body, length: { minimum: 1 }, presence: true
end
