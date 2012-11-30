class AddAttachmentMainImageToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.has_attached_file :main_image
    end
  end

  def self.down
    drop_attached_file :members, :main_image
  end
end
