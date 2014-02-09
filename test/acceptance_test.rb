require_relative 'test_helper'

class AcceptanceTestCase < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    WebService
  end

  def mailbox
    Mail::TestMailer.deliveries
  end

  def teardown
    mailbox.clear
  end

  def test_sends_an_invoice
    post '/invoices', invoice: {
      to: 'client@example.com',
      description: 'Services rendered',
      amount: 1000.0,
      from: 'Adam Hawkins'
    }

    assert_equal 200, last_response.status

    refute_emtpy mailbox
  end
end
