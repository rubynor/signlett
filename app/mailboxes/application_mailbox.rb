class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /(.+)@signlett.no/i => :bouncer
  routing /signature-(.+)@signlett.no/i => :sign
end
