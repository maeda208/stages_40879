class AddBirthDateAndAgeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :age, :integer
  end
end
