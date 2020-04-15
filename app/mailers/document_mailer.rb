class DocumentMailer < ApplicationMailer
  default from: 'signering@signlett.no'

  def signature_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    attachments[@document.file.filename.to_s] = { mime_type: 'application/pdf', content: @document.file.download}
    mail(to: @email,
         reply_to: 'signature-' + @document.email_token.to_s + '@signlett.no',
         subject: 'Du har et dokument til signering')
  end

  def no_attachment_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    mail(to: @email,
         reply_to: 'signature-' + @document.email_token.to_s + '@signlett.no',
         subject: 'Du mangler vedlegg')
  end

  def signing_complete
    @email = params[:email]
    @document = params[:document]

    attachments[@document.file.filename.to_s] = { mime_type: 'application/pdf', content: @document.file.download}

    mail(to: @email,
         subject: 'Signeringer gjennomført')
  end
end
