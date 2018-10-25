class NewsletterMailer < ApplicationMailer
  default from: "Newsletter@MyCV <quannnl97@gmail.com>"

  def SendAll(message)
    @message = message
    Email.all.each do |e|
      @email = e.email
      mail(to: @email, subject: 'Newsletter')
    end
  end
end
