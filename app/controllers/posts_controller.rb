class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successful post!"
    end
    redirect_to current_user
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
