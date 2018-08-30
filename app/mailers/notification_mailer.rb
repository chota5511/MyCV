class NotificationMailer < ApplicationMailer
  default from: "Notification@MyCV <quannnl97@gmail.com>"

  #Sent message to notify a contact message was submited
  def Contact (subject, email, name, message)
    @email = email
    @message = message
    @name = name
    mail(to: "quannnl92@gmail.com", subject: subject)
  end

  #Sent message when a error with Contact method was happened
  def ContactSubmitFailed
    mail(to: "quannnl92@gmail.com", subject: "A failed contact submit")
  end

end
