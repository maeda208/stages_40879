class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :email,              null: false, default: ""
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.text   :message
      t.string :bank      
      t.integer :branch
      t.integer :account
      t.integer :amount
      t.integer :commission
      t.references :user,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
