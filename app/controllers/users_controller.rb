class UsersController < ApplicationController

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
end
