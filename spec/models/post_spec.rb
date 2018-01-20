require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:topic) { create(:topic) }
  let(:post) { create(:post) }

  it { is_expected.to belong_to(:topic)}

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(1) }

  describe "attributes" do
    it "should have a body attribute" do
      expect(post).to have_attributes(body: post.body)
    end
  end
end
