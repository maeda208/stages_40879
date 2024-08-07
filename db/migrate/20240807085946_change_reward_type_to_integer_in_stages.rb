class ChangeRewardTypeToIntegerInStages < ActiveRecord::Migration[7.0]
  def change
    # 現在のリワードカラムを一時的にリネーム
    rename_column :stages, :reward, :old_reward

    # 新しいリワードカラムを追加
    add_column :stages, :reward, :integer

    # データを移行
    Stage.reset_column_information
    Stage.find_each { |stage| stage.update_column(:reward, stage.old_reward.to_i) }

    # 一時的なカラムを削除
    remove_column :stages, :old_reward
  end
end
