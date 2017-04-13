require 'test_helper'

class LandingpageControllerTest < ActionDispatch::IntegrationTest
  test "should get landingpage" do
    get landingpage_landingpage_url
    assert_response :success
  end

end
