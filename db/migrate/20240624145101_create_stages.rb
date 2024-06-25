class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :reward, null: false
      t.string :title, null: false
      t.integer :month_id, null: false
      t.integer :day_id, null:false
      t.integer :show_hour_id, null:false
      t.integer :show_minute_id
      t.integer :end_hour_id, null:false
      t.integer :end_minute_id
      t.string :theater, null:false
      t.string :address, null:false
      t.text   :conditions, null:false
      t.timestamps
    end
  end
end
