class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # POST /comments
  # POST /comments.json
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { render partial: "comments/comment", locals: {comment: @comment}, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render pins_path }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @id_ = @comment.id
    @is_destroyed = @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:pin_id, :body, :user_id)
    end
end
