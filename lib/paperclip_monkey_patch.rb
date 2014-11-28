# Only in test mode do we prevent Paperclip from deleting attachments on disk
module Paperclip
  class Attachment
    def clear
      instance_write(:file_name, nil)
      instance_write(:content_type, nil)
      instance_write(:file_size, nil)
      instance_write(:updated_at, nil)
    end
  end
end