require_relative 'test_helper'

class SendInvoiceFormTest < MiniTest::Unit::TestCase
  def test_has_a_name_accessor
    form = SendInvoiceForm.new
    form.name = 'Adam Hawkins'
    assert_equal 'Adam Hawkins', form.name
  end

  def test_has_an_email_accessor
    form = SendInvoiceForm.new
    form.email = 'example@example.com'
    assert_equal 'example@example.com', form.email
  end

  def test_as_an_amount_accessor
    form = SendInvoiceForm.new
    form.amount = 1000.0
    assert_equal 1000, form.amount
  end

  def test_has_description_accessor
    form = SendInvoiceForm.new
    form.description = 'services rendered'
    assert_equal 'services rendered', form.description
  end
end
