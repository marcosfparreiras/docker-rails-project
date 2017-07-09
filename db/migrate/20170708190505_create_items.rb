class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status, default: 0
      t.text :details
      t.date :deadline
      t.date :date_completed
      t.references :player, foreign_key: true
    end
  end
end
