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
    redirect_to :back
  end

  def unfollow
    @follower = Follower.find(params[:follow])
    @follower.destroy
    redirect_to :back
  end

  private
    def set_follower
      @follower = Follower.find(params[:id])
    end

    def follower_params
      params.require(:follower).permit(:follower_id, :followed_id)
    end
end
