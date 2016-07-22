class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.datetime :current_datetime
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
