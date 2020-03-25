class DocumentMailer < ApplicationMailer
  default from: 'signering@signlett.com'

  def signature_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    attachments[@document.file.filename.to_s] = { mime_type: 'application/pdf', content: @document.file.download}
    mail(to: @email,
         reply_to: 'signature-' + @document.id.to_s + '@signlett.com',
         subject: 'Du har et dokument til signering')
  end

  def no_attachment_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    mail(to: @email,
         reply_to: 'signature-' + @document.id.to_s + '@signlett.com',
         subject: 'Du mangler vedlegg')
  end
end
