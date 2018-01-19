class RemoveStartdateFromBookClub < ActiveRecord::Migration[5.1]
  def change
    remove_column :book_clubs, :startdate, :date
  end
end
