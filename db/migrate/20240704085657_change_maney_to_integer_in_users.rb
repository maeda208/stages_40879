class ChangeManeyToIntegerInUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :maney_temporary, :integer unless column_exists? :users, :maney_temporary

    User.reset_column_information

    User.find_each do |user|
      user.update!(maney_temporary: user.maney.to_i)
    end

    remove_column :users, :maney if column_exists? :users, :maney
    rename_column :users, :maney_temporary, :maney
  end

  def down
    add_column :users, :maney_temporary, :string unless column_exists? :users, :maney_temporary

    User.reset_column_information

    User.find_each do |user|
      user.update!(maney_temporary: user.maney.to_s)
    end

    remove_column :users, :maney if column_exists? :users, :maney
    rename_column :users, :maney_temporary, :maney
  end
end