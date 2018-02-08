require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:my_user) { create(:user, email: Faker::Internet.email) }
  let(:my_book_club) { create(:book_club) }
  let(:my_topic) { create(:topic, book_club: my_book_club) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:comments) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:body).is_at_least(1) }

  describe "attributes" do
    it "should have a body and user attribute" do
      expect(my_post).to have_attributes(body: my_post.body, user: my_post.user)
    end
  end
end
