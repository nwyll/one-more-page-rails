class AddEndDateToBookClub < ActiveRecord::Migration[5.1]
  def change
    add_column :book_clubs, :end_date, :date
  end
end
