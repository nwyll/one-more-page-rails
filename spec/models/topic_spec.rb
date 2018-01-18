require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(topic).to have_attributes(name: topic.name)
    end

    it "responds to type" do
      expect(topic).to respond_to(:type)
    end
  end

  describe "type" do
    it "is a general topic by default" do
      expect(topic.type).to eql("general")
    end
  end

end
