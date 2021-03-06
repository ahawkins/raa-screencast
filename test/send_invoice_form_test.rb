require_relative 'test_helper'

class SendInvoiceFormTest < MiniTest::Unit::TestCase
  attr_reader :form

  def setup
    @form = SendInvoiceForm.new
  end

  def test_can_assign_attribute_from_a_hash
    form = SendInvoiceForm.new name: 'Adam'
    assert_equal 'Adam', form.name
  end

  def test_can_assign_a_name_as_a_string
    form.name = :adam
    assert_equal "adam", form.name
  end

  def test_can_assign_an_email_as_a_string
    form.email = :example_email
    assert_equal "example_email", form.email
  end

  def test_can_assign_an_amount_as_a_float
    form.amount = '1000.0'
    assert_equal 1000.0, form.amount
  end

  def test_can_assign_a_description_as_a_string
    form.description = :services_rendered
    assert_equal "services_rendered", form.description
  end
end
