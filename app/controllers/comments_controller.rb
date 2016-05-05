class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      flash[:notice] = "Comment saved!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      flash[:notice] = "Comment deleted!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
