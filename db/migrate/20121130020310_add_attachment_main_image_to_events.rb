class AddAttachmentMainImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.has_attached_file :main_image
    end
  end

  def self.down
    drop_attached_file :events, :main_image
  end
end
