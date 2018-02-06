class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    book_club = BookClub.find(params[:book_club_id])
    membership = current_user.memberships.build(book_club: book_club)

    respond_to do |format|
      if membership.save
        format.html { redirect_to book_club, notice: 'Joined book club.' }
      else
        format.html { redirect_to book_club, notice: 'Error occured.' }
      end
    end
  end

  def destroy
    book_club = BookClub.find(params[:book_club_id])
    membership = current_user.memberships.find(params[:id])

    respond_to do |format|
      if membership.destroy
        format.html { redirect_to book_club, notice: 'You are no longer following this book club.' }
      else
        format.html { redirect_to book_club, notice: 'Error occured.' }
      end
    end
  end
end
