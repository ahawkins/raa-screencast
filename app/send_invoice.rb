class SendInvoice
  def initialize(form)
    @form = form
  end

  def run!
    mail = Mail.new
    mail.from = 'invoices@invoicer.com'
    mail.subject = "New invoice from #{form.name}"
    mail.to = form.email
    mail.body = "Invoice for #{form.amount} for #{form.description}"
    mail.deliver!
    mail
  end

  private
  def form
    @form
  end
end
