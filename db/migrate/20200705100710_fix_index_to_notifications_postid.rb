class FixIndexToNotificationsPostid < ActiveRecord::Migration[6.0]
  def change
    rename_index :notifications, :post_id, :photo_id
  end
end
