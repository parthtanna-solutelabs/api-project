class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :side_effects
      t.references :medical_condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
