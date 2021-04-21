class ChangeDefaultCardagainToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :card_id, from: "--", to: 0
  end
end
