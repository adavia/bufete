class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :employee, optional: true
end
