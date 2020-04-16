class BounceMailbox < ApplicationMailbox

  def process
    bounce_with
  end

end