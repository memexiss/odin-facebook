class FriendshipsController < ApplicationController
    def index
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:notice] = "User followed."
        redirect_to users_path
      else
        flash[:error] = "Unable to follow user."
        redirect_to root_url
      end
    end
    
    def destroy
      @friendship = current_user.friendships.find(params[:id])
      @friendship.destroy
      flash[:notice] = "Removed follow."
      redirect_to current_user
    end
  end
  