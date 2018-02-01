class BookClubsController < ApplicationController
  before_action :set_book_club, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, if: :current_book_club?, only: :show, raise: false
  # skip_before_action :authenticate_user!, only: :show, if: :current_book_club?
  skip_before_action :authenticate_user!, only: :show, raise: false
  before_action :authenticate_user!, unless: :current_book_club?

  # GET /book_clubs
  # GET /book_clubs.json
  def index
    @current = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
    @upcoming = BookClub.where(':date < start_date', date: Date.today)
    @past = BookClub.where(':date > end_date', date: Date.today)
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
  # POST /book_clubs.json
  def create
    @book_club = BookClub.new(book_club_params)
    authorize @book_club

    respond_to do |format|
      if @book_club.save
        format.html { redirect_to @book_club, notice: 'Book club was successfully created.' }
        format.json { render :show, status: :created, location: @book_club }
      else
        format.html { render :new }
        format.json { render json: @book_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_clubs/1
  # PATCH/PUT /book_clubs/1.json
  def update
    authorize @book_club

    respond_to do |format|
      if @book_club.update(book_club_params)
        format.html { redirect_to @book_club, notice: 'Book club was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_club }
      else
        format.html { render :edit }
        format.json { render json: @book_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_clubs/1
  # DELETE /book_clubs/1.json
  def destroy
    authorize @book_club
    @book_club.destroy

    respond_to do |format|
      format.html { redirect_to book_clubs_url, notice: 'Book club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_club
      @book_club = BookClub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_club_params
      params.require(:book_club).permit(:title, :author, :description, :start_date, :end_date, :cover)
    end
<<<<<<< Updated upstream
=======

    def current_book_club?
      current_book_clubs = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
      current_book_clubs.exists?(id: params[:id])

      # @book_club = BookClub.find(params[:id])
      # @book_club.current?(@bookclub.id)
    end
>>>>>>> Stashed changes
end
