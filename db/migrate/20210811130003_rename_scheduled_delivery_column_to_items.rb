class RenameScheduledDeliveryColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :scheduled_delivery, :scheduled_delivery_id
  end
end
