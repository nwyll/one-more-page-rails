require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(my_user).to have_attributes(name: my_user.name)
    end

    it "responds to role" do
      expect(my_user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(my_user).to respond_to(:admin?)
    end

    it "responds to member?" do
      expect(my_user).to respond_to(:member?)
    end
  end

  describe "roles" do
    it "is a member by default" do
      expect(my_user.role).to eql("member")
    end

    context "member user" do
      it "returns true for #member?" do
        expect(my_user.member?).to be_truthy
      end

      it "returns false for #admin?" do
        expect(my_user.admin?).to be_falsey
      end
    end

    context "admin user" do
      before do
        my_user.admin!
      end

      it "returns false for #member?" do
        expect(my_user.member?).to be_falsey
      end

      it "returns true for #admin?" do
        expect(my_user.admin?).to be_truthy
      end
    end
  end
end
