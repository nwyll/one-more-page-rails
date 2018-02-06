require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:my_user) { create(:user) }
  let(:my_book_club) { create(:book_club) }
  let(:membership) { Membership.create!(book_club: my_book_club, user: my_user) }

  it { is_expected.to belong_to(:book_club) }
  it { is_expected.to belong_to(:user) }
end
