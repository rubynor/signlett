class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /signature-(.+)@signlett.no/i => :sign
  routing :all => :bouncer
end
