class BookClubsController < ApplicationController
  before_action :set_book_club, only: [:show, :edit, :update, :destroy]

  # GET /book_clubs
  # GET /book_clubs.json
  def index
    @book_clubs = BookClub.all
  end

  # GET /book_clubs/1
  # GET /book_clubs/1.json
  def show
  end

  # GET /book_clubs/new
  def new
    @book_club = BookClub.new
  end

  # GET /book_clubs/1/edit
  def edit
  end

  # POST /book_clubs
  # POST /book_clubs.json
  def create
    @book_club = BookClub.new(book_club_params)

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
      params.fetch(:book_club, {})
    end
end
