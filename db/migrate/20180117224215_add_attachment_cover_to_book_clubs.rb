class AddAttachmentCoverToBookClubs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :book_clubs do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :book_clubs, :cover
  end
end
