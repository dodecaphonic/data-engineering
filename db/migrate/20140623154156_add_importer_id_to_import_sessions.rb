class AddImporterIdToImportSessions < ActiveRecord::Migration
  def change
    add_reference :import_sessions, :admin, index: true
  end
end
