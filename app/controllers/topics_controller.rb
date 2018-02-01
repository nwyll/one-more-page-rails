class TopicsController < ApplicationController
  before_action :set_book_club
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  
  skip_before_action :authenticate_user!, only: :show, raise: false
  before_action :authenticate_user!, unless: :current_book_club?

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = @book_club.topics.build
  end

  # GET /topics/1/edit
  def edit
    authorize @topic
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @book_club.topics.build(topic_params)
    @topic.user = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@book_club, @topic], notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    authorize @topic

    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to [@book_club, @topic], notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    authorize @topic
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to book_club_path(@book_club), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_club
      @book_club = BookClub.find(params[:book_club_id])
    end

    def set_topic
      @topic = @book_club.topics.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :topic_type)
    end
<<<<<<< Updated upstream
=======

    def current_book_club?
      current_book_clubs = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
      current_book_clubs.exists?(id: params[:id])
    end
>>>>>>> Stashed changes
end
