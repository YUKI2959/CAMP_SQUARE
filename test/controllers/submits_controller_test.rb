require 'test_helper'

class SubmitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submits_index_url
    assert_response :success
  end

end
