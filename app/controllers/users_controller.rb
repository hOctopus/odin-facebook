class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 10)
    if @user.friends.count > 0
      @friends = @user.friends.paginate(page: params[:page], per_page: 3)
    elsif @user.mutual_friends.count > 0
      @friends = @user.mutual_friends.paginate(page: params[:page], per_page: 3)
    end
  end

  def current_user_home
    redirect_to current_user
  end

  def user_friends
    @user = User.find_by(id: current_user.id)
    if @user.friends.count > 0
      @friends = @user.friends.paginate(page: params[:page], per_page: 3)
    elsif @user.mutual_friends.count > 0
      @friends = @user.mutual_friends.paginate(page: params[:page], per_page: 3)
    end
  end
end
