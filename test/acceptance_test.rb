require_relative 'test_helper'

class SendInvoiceTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    WebService
  end

  def test_sends_an_invoice
    post '/invoices', { invoice: {
      name: 'adam',
      email: 'client@example.com',
      description: 'Screencast',
      amount: 1000
    }}

    assert_equal 200, last_response.status

    refute_empty mailbox
  end
end
