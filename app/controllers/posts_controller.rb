class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET topics/1/posts/1
  # GET topics/1/posts/1.json
  def show
  end

  # GET topics/1/posts/new
  def new
    @post = @topic.posts.build
  end

  # GET topics/1/posts/1/edit
  def edit
  end

  # POST topics/1/posts
  # POST topics/1/posts.json
  def create
    @post = @topic.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@topic, @post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT topics/1/posts/1
  # PATCH/PUT topics/1/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@topic, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE topics/1/posts/1
  # DELETE topics/1/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to book_club_topic_path(@topic.book_club, @topic), notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_post
      @post = @topic.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :topic_id)
    end
end
