class AddApprovedToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :approved, :boolean, default: false
  end
end
