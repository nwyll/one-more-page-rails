class CreateBookClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :book_clubs do |t|
      t.string :title
      t.string :author
      t.text :description
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
