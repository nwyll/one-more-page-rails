class BookClub < ApplicationRecord
  has_many :topics
  has_attached_file :cover, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
