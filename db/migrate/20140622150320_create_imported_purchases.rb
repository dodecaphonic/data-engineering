class CreateImportedPurchases < ActiveRecord::Migration
  def change
    create_table :imported_purchases do |t|
      t.references :import_session
      t.references :purchase
      t.integer    :line_number

      t.timestamps
    end
  end
end
