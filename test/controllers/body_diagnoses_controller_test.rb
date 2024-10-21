require "test_helper"

class BodyDiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get body_diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get body_diagnoses_create_url
    assert_response :success
  end

  test "should get show" do
    get body_diagnoses_show_url
    assert_response :success
  end
end
