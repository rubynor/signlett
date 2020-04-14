class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /signature-(.+)@signlett.com/i => :sign
end
