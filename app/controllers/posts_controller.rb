class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Successful post!"
    else
      @feed_items = []
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
