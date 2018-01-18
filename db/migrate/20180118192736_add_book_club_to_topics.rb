class AddBookClubToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :book_club_id, :integer
    add_index :topics, :book_club_id
  end
end
