class Post < ApplicationRecord
  belongs_to :topic

  validates :body, length: { minimum: 1 }, presence: true
end
