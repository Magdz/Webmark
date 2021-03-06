class NotificationsController < ApplicationController
  before_action :set_notification, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @notifications = Notification.all
    respond_with(@notifications)
  end

  def show
    respond_with(@notifications)
  end

  def new
    @notification = Notification.new
    respond_with(@notification)
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.save
    respond_with(@notification)
  end

  def update
    @notification.update(notification_params)
    respond_with(@notification)
  end

  def destroy
    @notification.destroy
    respond_with(@notification)
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:user_id, :category_id, :subcategory_id, :bookmark_id, :recevier_id)
    end
end
