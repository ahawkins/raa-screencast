require_relative 'test_helper'

class SendInvoiceFormTest < MiniTest::Unit::TestCase
  attr_reader :form

  def setup
    @form = SendInvoiceForm.new
  end

  def test_can_be_initialized_with_a_hash
    form = SendInvoiceForm.new name: 'Adam'
    assert_equal 'Adam', form.name
  end

  def test_assigns_names_as_strings
    form.name = :adam
    assert_equal 'adam', form.name
  end

  def test_has_an_email_accessor
    form = SendInvoiceForm.new
    form.email = :example_address
    assert_equal 'example_address', form.email
  end

  def test_as_an_amount_accessor
    form = SendInvoiceForm.new
    form.amount = '1000.0'
    assert_equal 1000.0, form.amount
  end

  def test_has_description_accessor
    form = SendInvoiceForm.new
    form.description = :services_rendered
    assert_equal 'services_rendered', form.description
  end
end
