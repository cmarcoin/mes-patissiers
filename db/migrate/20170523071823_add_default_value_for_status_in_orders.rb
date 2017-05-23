class AddDefaultValueForStatusInOrders < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:orders, :status, 'En attente de validation')
  end
end
