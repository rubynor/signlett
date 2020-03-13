class SignMailbox < ApplicationMailbox
  MATCHER = /signature-(.+)@signlett.com/i

  before_processing :document_id

  def process
    document = Document.find(document_id)
    if document.present?
      recipient = Recipient.where(email: mail.from, document_id: document_id)
      if recipient.present? && document.file.attach(make_attachment)

        recipient.update(signed: true)
      end
    end
  end

  def attachment
    @_attachments = mail.attachments.map do |attachment|
      blob = ActiveStorage::Blob.create_after_upload!(
          io: StringIO.new(attachment.decoded),
          filename: attachment.filename,
          content_type: attachment.content_type
      )
      { original: attachment, blob: blob }
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
end