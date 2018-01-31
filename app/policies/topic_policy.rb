class TopicPolicy < ApplicationPolicy
  def show?

  end

  def update?
    user_who_can_access_topic
  end

  def destroy?
    user_who_can_access_topic
  end

  def user_who_can_access_topic
    if user
      record.user_id == user.id || user.admin?
    end
  end
end
