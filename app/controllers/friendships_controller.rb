class FriendshipsController < ApplicationController
  before_action :friend_wanted?, only: [:update, :destroy]

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(requested_id: params[]:requested_id],
                                 requester_id: params[:requester_id],
                                 accepted: false)
    @friendship.save
    flash[:success] = "Friend request sent! :)"
    redirect_to root_url
  end

  def edit
    @friendship = Friendship.find_by(id: params[:id])
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    if params[:accepted] == 'true'
      @friendship.accepted = true
      @friendship.save
      flash[:success] = "You are now friends!"
      redirect_to root_url
    else
      flash[:error] = "You can't do that."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    flash[:danger] = "You are no longer friends."
    @friendship.destroy
    redirect_to root_url
  end

  private
    def friend_wanted?
      @friendship = Friendship.find_by(id: params[:id])
      unless current_user == @friendship.requested || current_user == @friendship.requester
        flash[:danger] = "You don't have permission to do that."
        redirect_to root_url
      end
    end
end
