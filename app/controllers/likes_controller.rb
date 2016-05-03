class LikesController < ApplicationController

  def create
    post_id = params[:id]
    @like = current_user.likes.build(post_id: params[:id])

    if @like.save
      flash[:notice] = "You like that post!"
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to root_path
    end
  end

  def destroy
    post_id = params[:id]
    @like = current_user.likes.find_by_id(post_id)

    if @like.destroy
      flash[:notice] = "You no longer like that post"
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to root_path
    end
  end
end
