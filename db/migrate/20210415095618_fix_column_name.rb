class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :diseases, :type, :disease_type
  end
end
