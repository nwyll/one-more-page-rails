class TopicPolicy < ApplicationPolicy
  def create_post?
    when_user_can_access_topic
  end

  def update?
    user_who_can_access_topic
  end

  def destroy?
    user_who_can_access_topic
  end

  def user_who_can_access_topic
    if user
      (record.user_id == user.id && when_user_can_access_topic) || user.admin?
    end
  end

  def when_user_can_access_topic
    record.book_club.current?
  end
end
