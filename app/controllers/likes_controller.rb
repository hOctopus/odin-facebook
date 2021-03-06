class LikesController < ApplicationController

  def create
    post_id = params[:id]
    @like = current_user.likes.build(post_id: params[:id])

    if @like.save
      flash[:notice] = "Liked!"

    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to posts_path
  end

  def destroy
    post_id = params[:id]
    @like = current_user.likes.find_by_id(post_id)

    if @like.destroy
      flash[:notice] = "Un-liked!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to posts_path
  end
end
