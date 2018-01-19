class RemoveTypeFromTopic < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :type, :integer
  end
end
