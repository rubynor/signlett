class BouncerMailbox < ApplicationMailbox

  def process
    DocumentMailer.with(email: mail.from[0]).bounce_mail.deliver_later
  end

end