require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:book_club) { create(:book_club) }
  let(:topic) { create(:topic) }

  it { is_expected.to belong_to(:book_club) }
  it { is_expected. to have_many(:posts) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(topic).to have_attributes(name: topic.name)
    end

    it "responds to type" do
      expect(topic).to respond_to(:topic_type)
    end
  end

  describe "type" do
    it "is a general topic by default" do
      expect(topic.topic_type).to eql("general")
    end
  end

end
