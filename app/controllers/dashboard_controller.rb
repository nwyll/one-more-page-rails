class DashboardController < ApplicationController
  def index
    my_book_clubs = current_user.book_clubs
    @my_current_book_clubs = my_book_clubs.where(':date < end_date', date: Date.today)
    @my_past_book_clubs = my_book_clubs.where(':date > end_date', date: Date.today)
  end
end
