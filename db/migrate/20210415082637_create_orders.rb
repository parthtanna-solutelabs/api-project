class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :payment_method
      

      t.timestamps
    end
  end
end
