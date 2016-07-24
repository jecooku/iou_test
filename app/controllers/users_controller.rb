class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def users_amount_change
    @users = User.joins(:loan_offers => :loan_alterations).group("strftime('%Y,%W', loan_alterations.created_at)").group(:user_id).having('count(*) >= ?', 3).uniq
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
