require "test_helper"

class KpCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kp_comment = kp_comments(:one)
  end

  test "should get index" do
    get kp_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_kp_comment_url
    assert_response :success
  end

  test "should create kp_comment" do
    assert_difference("KpComment.count") do
      post kp_comments_url, params: { kp_comment: { content: @kp_comment.content, kp_post_id: @kp_comment.kp_post_id, kp_user_id: @kp_comment.kp_user_id } }
    end

    assert_redirected_to kp_comment_url(KpComment.last)
  end

  test "should show kp_comment" do
    get kp_comment_url(@kp_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_kp_comment_url(@kp_comment)
    assert_response :success
  end

  test "should update kp_comment" do
    patch kp_comment_url(@kp_comment), params: { kp_comment: { content: @kp_comment.content, kp_post_id: @kp_comment.kp_post_id, kp_user_id: @kp_comment.kp_user_id } }
    assert_redirected_to kp_comment_url(@kp_comment)
  end

  test "should destroy kp_comment" do
    assert_difference("KpComment.count", -1) do
      delete kp_comment_url(@kp_comment)
    end

    assert_redirected_to kp_comments_url
  end
end
