class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /(.+)@signlett.no/i => :bounce
  routing /signature-(.+)@signlett.no/i => :sign
end
