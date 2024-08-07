class ChangeRewardTypeInStages < ActiveRecord::Migration[7.0]
  def change
    # 現在進行中のカラムの操作をコメントアウトします
    # remove_column :stages, :reward
    # add_column :stages, :reward_temp, :integer
    # rename_column :stages, :reward_temp, :reward
  end
end