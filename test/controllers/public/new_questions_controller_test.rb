require "test_helper"

class Public::NewQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_new_questions_index_url
    assert_response :success
  end
end
