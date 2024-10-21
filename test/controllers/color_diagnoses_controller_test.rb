require "test_helper"

class ColorDiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get color_diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get color_diagnoses_create_url
    assert_response :success
  end

  test "should get show" do
    get color_diagnoses_show_url
    assert_response :success
  end
end
