class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string     :description, null: false
      t.decimal    :price, null: false, precision: 10, scale: 2
      t.references :merchant, null: false

      t.timestamps
    end
  end
end
