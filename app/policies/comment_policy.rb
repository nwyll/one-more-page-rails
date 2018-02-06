class CommentPolicy < ApplicationPolicy
  def update?
    user_who_can_access_comment
  end

  def destroy?
    user_who_can_access_comment
  end

  def user_who_can_access_comment
    if user
     (record.user_id == user.id && when_user_can_access_comment) || user.admin?
   end
  end

  def when_user_can_access_comment
    record.post.topic.book_club.current?
  end
end
