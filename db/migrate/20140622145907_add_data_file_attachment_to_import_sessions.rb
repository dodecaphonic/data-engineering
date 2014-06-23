class AddDataFileAttachmentToImportSessions < ActiveRecord::Migration
  def self.up
    add_attachment :import_sessions, :data_file
  end

  def self.down
    remove_attachment :import_sessions, :data_file
  end
end
