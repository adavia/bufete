class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :attachable, polymorphic: true, optional: true

  def name
    file.path.split("/").last
  end
end
