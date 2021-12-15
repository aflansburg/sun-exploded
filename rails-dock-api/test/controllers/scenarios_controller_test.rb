require "test_helper"

class ScenarioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scenario_new_url
    assert_response :success
  end

  test "should get create" do
    get scenario_create_url
    assert_response :success
  end
end
