class ChangeDefaultCard3ToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :card_id, from: 0, to: nil
  end
end
