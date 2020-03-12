class DocumentMailer < ApplicationMailer
  default from: 'signering@signlett.com'

  def signature_email
    @email = params[:email]
    @user = params[:user]
    @document = params[:document]

    attachments[@document.id.to_s + '_' + @document.file.filename.to_s] = { mime_type: 'application/pdf', content: @document.file.download}
    mail(to: @email,
         reply_to: @document.id.to_s + '_signering@signlett.com',
         subject: 'Du har et dokument til signering')
  end
end
