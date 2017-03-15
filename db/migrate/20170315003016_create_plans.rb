class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :value
      t.text :description

      t.timestamps
    end
  end
end
