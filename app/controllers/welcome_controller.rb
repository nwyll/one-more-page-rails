class WelcomeController < ApplicationController
  def index
    @current_book_clubs = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
  end
end
