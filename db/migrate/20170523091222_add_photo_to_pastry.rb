class AddPhotoToPastry < ActiveRecord::Migration[5.0]
  def change
    add_column :pastries, :photo, :string
  end
end
