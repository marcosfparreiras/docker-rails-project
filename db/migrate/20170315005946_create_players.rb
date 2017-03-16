class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      # Personal attributes
      t.string :name
      t.date :birthday
      t.string :cpf
      t.string :rg
      t.string :phones, array: true, default: []
      t.string :email
      t.string :address_street
      t.string :address_number
      t.string :address_complement
      t.string :address_neighborhood
      t.string :address_cep
      t.string :address_city
      t.string :address_state

      # Responsible attributes
      t.string :responsible_name
      t.string :responsible_cpf
      t.string :responsible_phones, array: true, default: []
      t.string :responsible_email

      # Exchange attributes
      t.string :sport_name
      t.string :headquarter
      t.date :conclusion_date
      t.date :travel_date

      # Signing fee attributes
      t.string :signing_situation
      t.decimal :signing_value
      t.string :signing_payment_mode

      # Advisory fee attributes
      t.string :advisory_situation
      t.decimal :advisory_value
      t.string :advisory_payment_mode
      t.text :advisory_notes

      # AE Acadmey attributes (Platform)
      # plan
      t.date :plan_end_date
      t.string :platform_payment_mode
      t.string :platform_payment_mode
      t.integer :platform_parcels
      t.text :platform_notes

      t.boolean :active, default: true

      t.timestamps
    end
  end
end
