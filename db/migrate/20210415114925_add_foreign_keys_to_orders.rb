class AddForeignKeysToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :user
    add_reference :orders, :medicine
    add_reference :orders, :dose
    add_reference :orders, :pack
    add_reference :orders, :address
    add_reference :orders, :card
  end
end
