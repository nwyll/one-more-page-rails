require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:memberships) }

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

  describe "#member_of(book_club)" do
    before do
      @book_club = create(:book_club)
      @user = create(:user)
    end

    it "returns false if the user has not joined the book_club" do
      expect(@user.member_of(@book_club)).to be false
    end

    it "returns true if the user has joined the book_club" do
      membership = @user.memberships.create(book_club: @book_club)
      expect(@user.member_of(@book_club)).to be true
    end
  end
end
