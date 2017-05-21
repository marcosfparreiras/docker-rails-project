class ChangeTravelDateTypeForPlayer < ActiveRecord::Migration[5.0]
  def up
    change_column :players, :travel_date, :string
  end

  def down
    change_column :players, :travel_date, :old_type
  end
end
