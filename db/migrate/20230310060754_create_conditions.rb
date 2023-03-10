class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|

      t.integer :condition_id, null: false
      t.timestamps
    end
  end
end
