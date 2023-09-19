require "test_helper"

class KpPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kp_post = kp_posts(:one)
  end

  test "should get index" do
    get kp_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_kp_post_url
    assert_response :success
  end

  test "should create kp_post" do
    assert_difference("KpPost.count") do
      post kp_posts_url, params: { kp_post: { kp_user_id: @kp_post.kp_user_id } }
    end

    assert_redirected_to kp_post_url(KpPost.last)
  end

  test "should show kp_post" do
    get kp_post_url(@kp_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_kp_post_url(@kp_post)
    assert_response :success
  end

  test "should update kp_post" do
    patch kp_post_url(@kp_post), params: { kp_post: { kp_user_id: @kp_post.kp_user_id } }
    assert_redirected_to kp_post_url(@kp_post)
  end

  test "should destroy kp_post" do
    assert_difference("KpPost.count", -1) do
      delete kp_post_url(@kp_post)
    end

    assert_redirected_to kp_posts_url
  end
end
