class BookClubPolicy < ApplicationPolicy
  def create?
    user_who_can_access_book_club
  end

  def update?
    user_who_can_access_book_club
  end

  def destroy?
    user_who_can_access_book_club
  end

  def user_who_can_access_book_club
    user.admin?
  end
end
