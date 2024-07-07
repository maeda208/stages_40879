class RenameManeyColumnToUsers < ActiveRecord::Migration[7.0]
  def change
      rename_column :users, :maney, :money
  end
end
