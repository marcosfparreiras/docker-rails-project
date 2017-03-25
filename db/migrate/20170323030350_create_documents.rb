class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.integer :status, default: 0
      t.string :path
      t.text :note
      t.references :document_type, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
