require_relative 'test_helper'

class AcceptanceTestCase < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    WebService
  end

  def test_sends_an_invoice
    post '/invoices'

    assert_equal 200, last_response.status
  end
end
