class SignMailbox < ApplicationMailbox
  MATCHER = /signature-(.+)@signlett.com/i

  before_processing :document_id

  def process
    if find_document
      recipient = find_recipient
      if recipient.present?
        if document.update(file: attachment)
          document.update!(file_path: Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true))
          recipient.update(signed: true)
        end
      end
    end
  end


  def make_attachment
    mail.attachments.each do |attachment|
      filename = attachment.filename
      begin
        return File.new(filename, "w") {|f| f.write attachment.decoded}
      end
    end
  end

  def document_id
  recipient = mail.recipients.find { |r| MATCHER.match?(r) }
  recipient[MATCHER, 1]
  end

  def find_recipient
    Recipient.where(email: mail.from, document_id: document_id)
  end

  def find_document
    Document.find(document_id)
  end

  #Alternative to the make_attachment method
  def attachment
     mail.attachments.map do |attachment|
      blob = ActiveStorage::Blob.create_after_upload!(
          io: StringIO.new(attachment.decoded),
          filename: attachment.filename,
          content_type: attachment.content_type
      )
      return blob
    end
  end
end