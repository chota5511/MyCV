class NotificationMailer < ApplicationMailer
  default from: "Notification@MyCV <quannnl97@gmail.com>"

  # Sent message to notify a contact message was submited
  def Contact (subject, email, name, message)
    @email = email
    @message = message
    @name = name
    mail(to: "quannnl92@gmail.com", subject: subject)
  end

  # Sent message when a error with Contact method was happened
  def ContactSubmitFailed
    mail(to: "quannnl92@gmail.com", subject: "A failed contact submit")
  end

  # Confirm to contact submiter
  def ContactConfirm(name, email)
    @name = name
    mail(from: "Submit Confirm - Do not reply <quannnl97@gmail.com>", to: email, subject: "Thanks for contacted me!")
  end

  # Sent message to notify a new newsletter was signed up
  def Newsletter(email)
    @email = email
    mail(to: "quannnl92@gmail.com", subject: "A new newsletter signed up")
  end

  # Confirm to Newsletter submitter
  def NewsletterConfirm(email)
    mail(from: "Submit Confirm - Do not reply <quannnl97@gmail.com>", to: email, subject: "Thank you for sign up newsletter")
  end

  # Sent message when a error with Newsletter method was happened
  def NewsletterSignupFailed
    mail(to: "quannnl92@gmail.com", subject: "A failed newsletter signup")
  end

end
