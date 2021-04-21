class CreateDoses < ActiveRecord::Migration[6.1]
  def change
    create_table :doses do |t|
      t.string :weight
      t.references :medicine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
