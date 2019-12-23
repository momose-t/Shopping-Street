require 'test_helper'

class StartsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get starts_about_url
    assert_response :success
  end

  test "should get concept" do
    get starts_concept_url
    assert_response :success
  end

  test "should get explain" do
    get starts_explain_url
    assert_response :success
  end

end
