class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.attachment :image
    end
  end
end
