class RemovePasswordResetCounterFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_reset_counter
  end
end
