require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact-us" do
    get :contact-us
    assert_response :success
  end

end
