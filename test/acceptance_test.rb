require_relative 'test_helper'

class AcceptanceTestCase < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def test_completes_the_flow
    post '/invoices'

    assert_equal 200, last_response.status
  end
end
