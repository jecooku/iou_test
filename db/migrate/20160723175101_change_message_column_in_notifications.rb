class ChangeMessageColumnInNotifications < ActiveRecord::Migration
  def change
    change_column :notifications, :message, :integer, default: 0
  end
end
