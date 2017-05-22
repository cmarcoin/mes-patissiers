class CreatePastries < ActiveRecord::Migration[5.0]
  def change
    create_table :pastries do |t|
      t.string :category
      t.string :name
      t.string :description
      t.integer :slices
      t.string :order_warning
      t.string :category
      t.integer :price
      t.integer :baker_id, foreign_key: true

      t.timestamps
    end
  end
end
