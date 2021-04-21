class CreateMedicalConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_conditions do |t|
      t.string :name
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
