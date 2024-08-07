class ChangeRewardTypeInStages < ActiveRecord::Migration[7.0]
  def change
    # 一時的なカラムを作成してデータを移動
    add_column :stages, :reward_temp, :integer
    # 既存のデータを新しいカラムに複製
    Stage.reset_column_information
    Stage.find_each { |stage| stage.update_column(:reward_temp, stage.reward.to_i) }
    # 古いカラムを削除
    remove_column :stages, :reward
    # 新しいカラム名を変更
    rename_column :stages, :reward_temp, :reward
  end
end