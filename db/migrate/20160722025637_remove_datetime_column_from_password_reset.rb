class RemoveDatetimeColumnFromPasswordReset < ActiveRecord::Migration
  def change
    remove_column :password_resets, :current_datetime
  end
end
