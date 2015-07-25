class ApplicationMailer < ActionMailer::Base
  default from: "admin@mangoes.com"
  layout 'mailer'
end