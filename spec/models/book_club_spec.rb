require 'rails_helper'

RSpec.describe BookClub, type: :model do
  let(:book_club) { create(:book_club) }

  it { is_expected.to have_many(:topics) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { is_expected.to validate_length_of(:title).is_at_least(1) }
  it { is_expected.to validate_length_of(:author).is_at_least(1) }
  it { is_expected.to validate_length_of(:description).is_at_least(10) }

  describe "attributes" do
    it "should have a title, author, description, start_date and end_date attributes" do
      expect(book_club).to have_attributes(title: book_club.title, author: book_club.author, description: book_club.description, start_date: book_club.start_date, end_date: book_club.end_date)
    end
  end
end
