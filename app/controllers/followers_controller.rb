class FollowersController < ApplicationController
  before_action :set_follower, only: [:show]

  respond_to :html

  def show
    respond_with(@follower)
  end

  def follow
    @follower = Follower.new
    @follower.follower_id = current_user.id
    @follower.followed_id = params[:id]
    @follower.save
    @notification = Notification.create(user_id: current_user.id , category_id: "0", subcategory_id: "10000000" , bookmark_id: "null" , recevier_id: @follower.followed_id )
    @notification.save 
    redirect_to :back
  end

  def unfollow
    @follower = Follower.find(params[:follow])
    @follower.destroy
    @notification = Notification.create(user_id: current_user.id , category_id: "0", subcategory_id: "0" , bookmark_id: "null" , recevier_id: @follower.followed_id )
    @notification.save 
    redirect_to :back
  end

  def followers_count
    @int = 0
    Follower.all.each do |follow|
      if follow.followed_id == current_user.id
        @int = @int + 1;
      end
    end
    return 70
  end

  def following_count
    @int = 0
    Follower.all.each do |follow|
      if follow.follower_id == current_user.id
        @int = @int + 1;
      end
    end
    return @int
  end

  private
    def set_follower
      @follower = Follower.find(params[:id])
    end

    def follower_params
      params.require(:follower).permit(:follower_id, :followed_id)
    end
end
