class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def welcome(email)
    attachments['information.pdf'] = File.read('information.pdf')
    mail(:to => email, :subject => "Información de bitacora de errores AmonRa")
  end
end
