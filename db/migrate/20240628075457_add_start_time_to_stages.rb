class AddStartTimeToStages < ActiveRecord::Migration[7.0]
  def change
    add_column :stages, :start_time, :datetime
  end
end
