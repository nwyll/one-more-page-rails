class BookClub < ApplicationRecord
  has_many :topics, dependent: :destroy

  has_attached_file :cover, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  validates :title, length: { minimum: 1, maximum: 100 }, presence: true
  validates :author, length: { minimum: 1, maximum: 100 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # Return whether a book_club is a currrent_club
  # def current?(book_club_id)
  #   current_book_clubs = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
  #   current_book_clubs.exists?(id: book_club_id)
  # end
end
