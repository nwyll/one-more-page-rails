class Topic < ApplicationRecord
  belongs_to :book_club

  before_save { self.type ||= :general }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  enum topic_type: [ :general, :section ]
end
