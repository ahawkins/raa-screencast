require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  def teardown
    Mail::TestMailer.deliveries.clear
  end

  def test_send_the_invoices_over_email
    form = SendInvoiceForm.new

    form.name = 'Adam Hawkins'
    form.email = 'example@example.com'
    form.description = 'Screencast'
    form.amount = 100

    use_case = SendInvoice.new form

    mail = use_case.run!

    assert_equal "New invoice from #{form.name}", mail.subject
    assert_equal [form.email], mail.to
    assert_includes mail.body.to_s, form.description
    assert_includes mail.body.to_s, form.amount.to_s
    refute_empty mail.from, "The email's from address must be set"

    assert_includes Mail::TestMailer.deliveries, mail
  end
end
