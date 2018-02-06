class PostPolicy < ApplicationPolicy
  def update?
    user_who_can_access_post
  end

  def destroy?
    user_who_can_access_post
  end

  def user_who_can_access_post
    if user
      (record.user_id == user.id && when_user_can_access_post) || user.admin?
    end
  end

  def when_user_can_access_post
    record.topic.book_club.current?
  end
end
