class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :delivery_date
      t.string :status
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :pastry, foreign_key: true

      t.timestamps
    end
  end
end
