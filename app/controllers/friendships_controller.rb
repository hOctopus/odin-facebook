class FriendshipsController < ApplicationController
  before_action :friend_wanted?, only: [:update, :destroy]

  def create
    @friendship = Friendship.new(requested_id: params[:requested_id],
                                 requester_id: params[:requester_id],
                                 accepted: false)
    if @friendship.save
      flash[:notice] = "Friend request sent! :)"
      redirect_to users_path
    else
      flash[:alert] = "Something went wrong, try again"
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    if params[:accepted] == 'true'
      @friendship.accepted = true
      @friendship.save
      flash[:notice] = "You are now friends!"
      redirect_to users_path
    else
      flash[:alert] = "You can't do that."
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    flash[:alert] = "You are no longer friends."
    @friendship.destroy
    redirect_to users_path
  end

  private
    def friend_wanted?
      @friendship = Friendship.find_by(id: params[:id])
      unless current_user == @friendship.requested || current_user == @friendship.requester
        flash[:alert] = "You don't have permission to do that."
        redirect_to users_path
      end
    end
end
