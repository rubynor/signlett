class SignMailbox < ApplicationMailbox
  MATCHER = /signature-(.+)@signlett.com/i

  before_processing :document_id

  def process
    document = find_document
    if document.present?
      recipient = find_recipient
      if recipient.present?
        if document.update(file: attachment)
          document.update!(file_path: Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true))
          DocumentEvent.create!(document: document, message: "#{mail.from[0]} signerte dokumentet")
          recipient.update(signed: true)
          send_mail(document)
        end
      end
    end
  end

  # Method for only sending mail to the first recipient that is not sent yet
  def send_mail(document)
    recipient = Recipient.where(document: document, sent: false).first
    if recipient.present?
      DocumentMailer.with(user: document.user,
                          email: recipient.email,
                          document: document).signature_email.deliver_later
      recipient.update(sent: true)
      DocumentEvent.create!(document: document, message: "E-post sendt til #{recipient.email} ")
      if document.status != 1
        document.update!(status: 1)
      end
    else
      document.update!(status: 2)
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