class AddStartDateToBookClub < ActiveRecord::Migration[5.1]
  def change
    add_column :book_clubs, :start_date, :date
  end
end
