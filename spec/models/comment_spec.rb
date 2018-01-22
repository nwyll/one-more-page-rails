require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { create(:post) }
  let(:comment) { create (:comment) }

  it { is_expected.to belong_to(:post) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(1) }

  describe "attributes" do
    it "should have a body attribute" do
      expect(comment).to have_attributes(body: comment.body)
    end
  end

end
