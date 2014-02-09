class SendInvoice
  def initialize(form)
    @form = form
  end

  def run!
    Mail.new
  end

  private
  def form
    @form
  end
end
