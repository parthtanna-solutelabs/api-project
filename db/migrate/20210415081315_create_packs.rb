class CreatePacks < ActiveRecord::Migration[6.1]
  def change
    create_table :packs do |t|
      t.integer :size
      t.integer :price
      t.references :dose, null: false, foreign_key: true

      t.timestamps
    end
  end
end
