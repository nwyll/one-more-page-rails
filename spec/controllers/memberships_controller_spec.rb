require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let(:member) { create(:user) }
  let(:admin) { create(:user, name: "Admin", email: "admin@bloc.io", role: :admin) }
  let(:my_book_club) { create(:book_club) }
  let(:my_membership) {create(:membership, user: member, book_club: my_book_club)}

  context 'guest' do
    describe 'POST create' do
      it 'redirects the user to the sign in view' do
        post :create, params: { book_club_id: my_book_club.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE destroy' do
      it 'redirects the user to the sign in view' do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_membership.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "signed in user" do
    before(:each) do
      member.confirm
      sign_in(member)
    end

    describe 'POST create' do
      it 'redirects to the book_club show view' do
        post :create, params: { book_club_id: my_book_club.id }
        expect(response).to redirect_to(my_book_club)
      end

      it 'creates a favorite for the current user and specified book_club' do
        expect(member.memberships.find_by_book_club_id(my_book_club.id)).to be_nil
        post :create, params: { book_club_id: my_book_club.id }
        expect(member.memberships.find_by_book_club_id(my_book_club.id)).not_to be_nil
      end
    end

    describe 'DELETE destroy' do
      it 'redirects to the book_club show view' do
        delete :destroy, params: { book_club_id: my_book_club.id, id: my_membership.id }
        expect(response).to redirect_to(my_book_club)
      end

      it 'destroys the membership for the current user and book_club' do
        membership = member.memberships.create(book_club_id: my_book_club.id)
        expect(member.memberships.find_by_book_club_id(my_book_club.id)).not_to be_nil

        delete :destroy, params: { book_club_id: my_book_club.id, id: membership.id }
        expect(member.memberships.find_by_book_club_id(my_book_club.id)).to be_nil
      end
    end
  end
end
