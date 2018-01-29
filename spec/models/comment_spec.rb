require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:my_user) { create(:user) }
  let(:my_book_club) { create(:book_club) }
  let(:my_topic) { create(:topic, book_club: my_book_club) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }
  let(:my_comment) { create(:comment, post: my_post, user: my_user)}

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:body).is_at_least(1) }

  describe "attributes" do
    it "should have a body and user attributes" do
      expect(my_comment).to have_attributes(body: my_comment.body, user: my_comment.user)
    end
  end

end
