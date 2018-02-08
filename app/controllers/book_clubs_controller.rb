class BookClubsController < ApplicationController
  before_action :set_book_club, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :show, raise: false
  before_action :authenticate_user!, unless: :current_book_club?, only: :show

  # GET /book_clubs
  def index
    @current = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
    @upcoming = BookClub.where(':date < start_date', date: Date.today)
    @past = BookClub.where(':date > end_date', date: Date.today).order(end_date: :desc).limit(50).paginate(page: params[:page], per_page: 6)
  end

  # GET /book_clubs/1
  # GET /book_clubs/1.json
  def show
    @general_topics = @book_club.topics.where("topic_type = '0'")
    @section_topics = @book_club.topics.where("topic_type = '1'")
  end

  # GET /book_clubs/new
  def new
    @book_club = BookClub.new
    authorize @book_club
  end

  # GET /book_clubs/1/edit
  def edit
    authorize @book_club
  end

  # POST /book_clubs
  def create
    @book_club = BookClub.new(book_club_params)
    authorize @book_club

    respond_to do |format|
      if @book_club.save
        format.html { redirect_to @book_club, notice: 'Book club was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /book_clubs/1
  def update
    authorize @book_club

    respond_to do |format|
      if @book_club.update(book_club_params)
        format.html { redirect_to @book_club, notice: 'Book club was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /book_clubs/1
  def destroy
    authorize @book_club
    @book_club.destroy

    respond_to do |format|
      format.html { redirect_to book_clubs_url, notice: 'Book club was successfully destroyed.' }
    end
  end

  private
    def set_book_club
      @book_club ||= BookClub.find(params[:id])
    end

    def book_club_params
      params.require(:book_club).permit(:title, :author, :description, :start_date, :end_date, :cover)
    end

    def current_book_club?
      set_book_club
      @book_club.current?
    end
end
