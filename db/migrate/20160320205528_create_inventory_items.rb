class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :label, null: false, index: true
      t.string :type, null: false
      t.string :location, null: false
      t.date :expiration_date, null: false
      t.boolean :is_removed, null: false, default: false

      t.timestamps null: false
    end
  end
end
