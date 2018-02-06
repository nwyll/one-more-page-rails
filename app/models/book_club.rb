class BookClub < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :memberships, dependent: :destroy

  has_attached_file :cover, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  validates :title, length: { minimum: 1, maximum: 100 }, presence: true
  validates :author, length: { minimum: 1, maximum: 100 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # Return whether a giveb book_club is a currrent_club
  def current?
    (start_date..end_date).cover?(Date.today)
  end

  # Return whether a giveb book_club is an upcoming_club
  def upcoming?
    (start_date > Date.today)
  end

  # Return whether a giveb book_club is a past_club
  def past?
    (end_date < Date.today)
  end
end
