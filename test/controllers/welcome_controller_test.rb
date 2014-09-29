require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get options" do
    get :options
    assert_response :success
  end

end
