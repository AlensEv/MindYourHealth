require "test_helper"

class DiagnosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get articles" do
    get diagnostics_articles_url
    assert_response :success
  end
end
