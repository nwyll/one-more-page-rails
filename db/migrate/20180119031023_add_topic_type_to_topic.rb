class AddTopicTypeToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :topic_type, :integer
  end
end
