class TopicPolicy < ApplicationPolicy
  def update?
    user_who_can_access_topic
  end

  def destroy?
    user_who_can_access_topic
  end

  def user_who_can_access_topic
    record.user_id == user.id || user.admin?
  end
end
