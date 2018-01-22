class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :body, length: { minimum: 1 }, presence: true
end
