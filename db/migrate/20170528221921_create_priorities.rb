class CreatePriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :priorities do |t|
      # player
      t.references :player, index: true, foreign_key: true

      # short term objectives
      t.text :interesting_subjects
      t.text :pretended_course
      t.string :pretended_formation_degree
      t.string :starting_season

      # long term objectives
      t.boolean :pretends_study_other_course
      t.text :other_pretended_course

      # $money
      t.text :family_amount_per_year
      t.string :finances_help, array: true, default: []

      # institution profile
      t.string :institution_type

      # highschool performance
      t.string :performance
      t.string :tests_taken, array: true, default: []
      t.string :institution_size
      t.string :internation_studants

      # adaptation
      t.string :usa_regions, array: true, default: []
      t.string :localization_area
      t.string :hosting_type
      t.string :interested_activities, array: true, default: []
      t.text :hobbies

      t.timestamps
    end
  end
end
