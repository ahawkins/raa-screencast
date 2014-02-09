require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  def test_send_the_invoices_over_email
    form = SendInvoiceForm.new
    use_case = SendInvoice.new form
  end
end
