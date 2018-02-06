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

  def join?
    if user
      record.current? || record.upcoming?
    end
  end

  def create_topic?
    if user
      (user.admin? && record.upcoming?) || record.current?
    end
  end

  def user_who_can_access_book_club
    if user
      user.admin?
    end
  end
end
