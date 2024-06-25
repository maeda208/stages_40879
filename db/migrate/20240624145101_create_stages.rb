class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :reward, null: false
      t.string :title, null: false
      t.string :month, null: false
      t.string :day, null:false
      t.string :show_hour, null:false
      t.string :show_minute, null: false
      t.string :end_hour, null:false
      t.string :end_minute, null:false
      t.string :theater, null:false
      t.string :address, null:false
      t.text   :conditions, null:false
      t.timestamps
    end
  end
end
