class AddAttachmentFileToBugs < ActiveRecord::Migration
  def self.up
    change_table :bugs do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :bugs, :file
  end
end
