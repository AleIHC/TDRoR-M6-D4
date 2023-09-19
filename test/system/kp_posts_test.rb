require "application_system_test_case"

class KpPostsTest < ApplicationSystemTestCase
  setup do
    @kp_post = kp_posts(:one)
  end

  test "visiting the index" do
    visit kp_posts_url
    assert_selector "h1", text: "Kp posts"
  end

  test "should create kp post" do
    visit kp_posts_url
    click_on "New kp post"

    fill_in "Kp user", with: @kp_post.kp_user_id
    click_on "Create Kp post"

    assert_text "Kp post was successfully created"
    click_on "Back"
  end

  test "should update Kp post" do
    visit kp_post_url(@kp_post)
    click_on "Edit this kp post", match: :first

    fill_in "Kp user", with: @kp_post.kp_user_id
    click_on "Update Kp post"

    assert_text "Kp post was successfully updated"
    click_on "Back"
  end

  test "should destroy Kp post" do
    visit kp_post_url(@kp_post)
    click_on "Destroy this kp post", match: :first

    assert_text "Kp post was successfully destroyed"
  end
end
