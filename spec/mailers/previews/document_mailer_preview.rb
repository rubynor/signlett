# Preview all emails at http://localhost:3000/rails/mailers/document_mailer
class DocumentMailerPreview < ActionMailer::Preview
  def signature_email
    DocumentMailer.with(user: User.first, email: "someone@example.com", document: Document.first).signature_email
  end

  def signing_complete
    DocumentMailer.with(user: User.first, email: "someone@example.com", document: Document.first).signing_complete
  end
end
