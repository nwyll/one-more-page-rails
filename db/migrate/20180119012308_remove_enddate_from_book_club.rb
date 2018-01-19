class RemoveEnddateFromBookClub < ActiveRecord::Migration[5.1]
  def change
    remove_column :book_clubs, :enddate, :date
  end
end
