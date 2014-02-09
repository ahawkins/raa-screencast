require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  def mailbox
    Mail::TestMailer.deliveries
  end

  def teardown
    mailbox.clear
  end

  def test_sends_an_invoice
    form = SendInvoiceForm.new

    form.name = 'Adam'
    form.email = 'example@example.com'
    form.amount = 1000
    form.description = 'Screencast'

    use_case = SendInvoice.new form

    mail = use_case.run!

    assert_equal "New invoice from #{form.name}",  mail.subject
    assert_equal [form.email], mail.to
    assert_includes mail.body.to_s, form.description
    assert_includes mail.body.to_s, form.amount.to_s
    refute_empty mail.from, "From address must be set"

    assert_includes mailbox, mail
  end
end
