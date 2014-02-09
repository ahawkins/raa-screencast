require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  def test_send_the_invoices_over_email
    form = SendInvoiceForm.new

    form.name = 'Adam Hawkins'
    form.email = 'example@example.com'
    form.description = 'Screencast'
    form.amount = 100

    use_case = SendInvoice.new form

    use_case.run!
  end
end
