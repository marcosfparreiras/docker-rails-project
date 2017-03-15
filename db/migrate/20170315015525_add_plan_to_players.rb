class AddPlanToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :plan, foreign_key: true
  end
end
