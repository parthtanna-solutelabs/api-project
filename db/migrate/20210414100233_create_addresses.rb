class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
