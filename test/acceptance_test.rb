require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def test_sends_an_invoice
    post '/invoices'

    assert_equal 200, last_response.status
  end
end
