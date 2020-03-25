class SignMailbox < ApplicationMailbox
  MATCHER = /signature-(.+)@signlett.com/i

  before_processing :email_token

  def process
    document = find_document
    if attachment.present?
      if document.present?
        recipient = find_recipient
        if recipient.present?
          if document.update(file: attachment)
            document.update!(file_path: Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true))
            DocumentEvent.create!(document: document, message: "#{mail.from[0]} signerte dokumentet")
            recipient.update(signed: true)
            document.regenerate_email_token
            send_new_mail(document)
          end
        end
      end
    else
      send_not_allowed_mail(document)
    end
  end

  # Method for only sending mail to the first recipient that is not sent yet
  def send_new_mail(document)
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

  # Method for sending mail if no attachment is found
  def send_not_allowed_mail(document)
    DocumentMailer.with(user: document.user,
                        email: mail.from[0],
                        document: document).no_attachment_email.deliver_later
  end

  # Method for making a viable ActiveStorage blob from attachment
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

  # Retrieve email_token from mail
  def email_token
  recipient = mail.recipients.find { |r| MATCHER.match?(r) }
  recipient[MATCHER, 1]
  end

  def find_recipient
    Recipient.where(email: mail.from, document: find_document)
  end

  def find_document
    Document.find_by_email_token(email_token)
  end

end