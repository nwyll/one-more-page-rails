class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET posts/1/comments/1/edit
  def edit
    authorize @comment
  end

  # POST posts/1/comments
  # POST posts/1/comments.json
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post.topic, @post], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to [@post.topic, @post], notice: 'Error. Comment failed to save.'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT posts/1/comments/1
  # PATCH/PUT posts/1/comments/1.json
  def update
    authorize @comment

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@post.topic, @post], notice: 'Commment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE posts/1/comments/1
  # DELETE posts/1/comments/1.json
  def destroy
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to [@post.topic, @post], notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
     params.require(:comment).permit(:body)
   end

end
