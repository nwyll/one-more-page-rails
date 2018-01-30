class Topic < ApplicationRecord
  belongs_to :book_club
  belongs_to :user
  has_many :posts, dependent: :destroy

  before_save { self.topic_type ||= :general }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  enum topic_type: [ :general, :section ]
end
