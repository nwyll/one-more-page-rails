class TopicsController < ApplicationController
  before_action :set_book_club
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :show, raise: false
  before_action :authenticate_user!, unless: :current_book_club?,  only: :show

  # GET book_clubs/1/topics/1
  def show
  end

  # GET book_clubs/1/topics/new
  def new
    @topic = @book_club.topics.build
  end

  # GET book_clubs/1/topics/1/edit
  def edit
    authorize @topic
  end

  # POST book_clubs/1/topics
  def create
    @topic = @book_club.topics.build(topic_params)
    @topic.user = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@book_club, @topic], notice: 'Topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT book_clubs/1/topics/1
  def update
    authorize @topic

    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to [@book_club, @topic], notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE book_clubs/1/topics/1
  def destroy
    authorize @topic
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to book_club_path(@book_club), notice: 'Topic was successfully destroyed.' }
    end
  end

  private
    def set_book_club
      @book_club ||= BookClub.find(params[:book_club_id])
    end

    def set_topic
      @topic = @book_club.topics.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :topic_type)
    end

    def current_book_club?
<<<<<<< Updated upstream
      set_book_club
      @book_club.current?
=======
      current_book_clubs = BookClub.where(':date BETWEEN start_date AND end_date', date: Date.today)
      current_book_clubs.exists?(id: params[:id])
>>>>>>> Stashed changes
    end
end
