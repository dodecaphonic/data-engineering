class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :item, index: true, null: false
      t.integer    :quantity, null: false
      t.references :purchaser, index: true, null: false

      t.timestamps
    end
  end
end
