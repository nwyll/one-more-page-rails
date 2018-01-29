class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :topic, presence: true
  validates :user, presence: true

  validates :body, length: { minimum: 1 }, presence: true
end
