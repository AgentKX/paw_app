class AddAttachmentAvatarToPaws < ActiveRecord::Migration
  def self.up
    change_table :paws do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :paws, :avatar
  end
end
