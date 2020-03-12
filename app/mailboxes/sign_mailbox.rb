class SignMailbox < ApplicationMailbox
  RECIPIENT_FORMAT = /signature\-(.+)@signlett.com/i

  before_processing :document_id

  def process
    document = Document.find(document_id)
    document.update!(status: 1)
  end

  def document_id
    recipient = mail.recipients.find { |r| RECIPIENT_FORMAT.match?(r) }
    recipient[RECIPIENT_FORMAT, 1]
  end
end