class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing SignMailbox::MATCHER => :sign
end
