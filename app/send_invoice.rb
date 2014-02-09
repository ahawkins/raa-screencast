class SendInvoice
  def initialize(form)
    @form = form
  end

  def run!
    mail = Mail.new
    mail.subject = "New invoice from #{form.name}"
    mail.to = form.email
    mail.body = "You have a invoice for #{form.amount} about #{form.description}"
    mail

    mail.deliver!

    mail
  end

  private
  def form
    @form
  end
end
