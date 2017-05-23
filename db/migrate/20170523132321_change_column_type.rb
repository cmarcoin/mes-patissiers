class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :pastries, :description, :text
  end
end
