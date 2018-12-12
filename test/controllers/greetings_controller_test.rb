require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get greetings_welcome_url
    assert_response :success
  end

end
