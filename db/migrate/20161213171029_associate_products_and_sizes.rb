class AssociateProductsAndSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :products_sizes do |t|
      t.references :product, index: true
      t.references :size, index: true
      t.timestamps
    end
  end
end
