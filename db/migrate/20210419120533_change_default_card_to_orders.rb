class ChangeDefaultCardToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :card_id, from: nil, to: "--"
  end
end
