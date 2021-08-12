class RenameChargesIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :charges_id, :charge_id
  end
end
