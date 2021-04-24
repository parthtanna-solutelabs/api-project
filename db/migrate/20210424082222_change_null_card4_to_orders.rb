class ChangeNullCard4ToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :card_id, true 
  end
end
