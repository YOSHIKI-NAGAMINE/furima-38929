class CreateShippingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_days do |t|

      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
