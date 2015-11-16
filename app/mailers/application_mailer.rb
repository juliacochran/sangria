class ApplicationMailer < ActionMailer::Base
  default from: "sangrianotify@gmail.com"
  ActionMailer::Base.default_url_options[:host] = "sangriaapp.tk"

  layout 'mailer'
end
