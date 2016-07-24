class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def new

  end

  def create
    @notification = Notification.new(:user)
    if @notification.save
      flash[:notice] = 'notification created'
      redirect_to root_url
    else
      flash[:alert] = 'error when creating notification'
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      flash[:notice] = 'Notification destroyed'
      redirect_to notifications_path
    else
      flash[:notice] = 'Error while deleting notification'
      redirect_to notifications_path
    end
  end

end
