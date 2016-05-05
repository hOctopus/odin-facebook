class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Successful post!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to root_url
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "Post deleted!"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to root_url
  end

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 20)
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
