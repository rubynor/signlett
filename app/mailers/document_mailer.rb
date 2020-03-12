class DocumentMailer < ApplicationMailer
  default from: 'system@signlett.com'

  def signature_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    attachments[@document.file.filename.to_s] = { mime_type: 'application/pdf', content: @document.file.download}
    mail(to: @email, subject: 'Du har et dokument til signering')
  end
end
