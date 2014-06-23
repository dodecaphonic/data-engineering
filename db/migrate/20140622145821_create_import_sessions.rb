class CreateImportSessions < ActiveRecord::Migration
  def change
    create_table :import_sessions do |t|

      t.timestamps
    end
  end
end
