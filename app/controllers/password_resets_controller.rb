class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => 'password reset instructions sent'
  end

  def edit
    if User.exists?(:password_reset_token => params[:id])
      @user = User.find_by_password_reset_token!(params[:id])
    else
      flash[:notice] = 'Wrong password token'
      redirect_to new_password_reset_path
    end
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => 'password reset has expired'
    elsif @user.update_attributes(password_reset_params)
      @user.password_resets.create
      if @user.password_resets.where('created_at >= ?', 1.day.ago).count > 3
        flash[:alert] = 'Password reset more than 3 times today'
      end
      redirect_to root_url, :notice => 'Password reset successfully'
    else
      render 'edit'
    end
  end

  private

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
