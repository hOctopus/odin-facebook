class UsersController < ApplicationController

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    if current_user.id == params[:id]
      @user = current_user
      @post = Post.new
    else
      @user = User.find_by(id: params[:id])
    end
  end
end
