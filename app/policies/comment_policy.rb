class CommentPolicy < ApplicationPolicy
  def update?
    user_who_can_access_comment
  end

  def destroy?
    user_who_can_access_comment
  end

  def user_who_can_access_comment
    record.user_id == user.id || user.admin?
  end
end
