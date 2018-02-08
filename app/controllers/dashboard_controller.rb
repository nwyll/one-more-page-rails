class DashboardController < ApplicationController
  def index
    my_book_clubs = current_user.book_clubs
    @my_current_book_clubs = my_book_clubs.where(':date < end_date', date: Date.today)
    @my_past_book_clubs = my_book_clubs.where(':date > end_date', date: Date.today).order(end_date: :desc).limit(50).paginate(page: params[:page], per_page: 12)
  end
end
