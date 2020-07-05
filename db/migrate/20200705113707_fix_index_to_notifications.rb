class FixIndexToNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_index :notifications, :post_id
    add_index :notifications, :photo_id
  end
end
