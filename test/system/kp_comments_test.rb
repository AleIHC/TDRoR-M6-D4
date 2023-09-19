require "application_system_test_case"

class KpCommentsTest < ApplicationSystemTestCase
  setup do
    @kp_comment = kp_comments(:one)
  end

  test "visiting the index" do
    visit kp_comments_url
    assert_selector "h1", text: "Kp comments"
  end

  test "should create kp comment" do
    visit kp_comments_url
    click_on "New kp comment"

    fill_in "Content", with: @kp_comment.content
    fill_in "Kp post", with: @kp_comment.kp_post_id
    fill_in "Kp user", with: @kp_comment.kp_user_id
    click_on "Create Kp comment"

    assert_text "Kp comment was successfully created"
    click_on "Back"
  end

  test "should update Kp comment" do
    visit kp_comment_url(@kp_comment)
    click_on "Edit this kp comment", match: :first

    fill_in "Content", with: @kp_comment.content
    fill_in "Kp post", with: @kp_comment.kp_post_id
    fill_in "Kp user", with: @kp_comment.kp_user_id
    click_on "Update Kp comment"

    assert_text "Kp comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Kp comment" do
    visit kp_comment_url(@kp_comment)
    click_on "Destroy this kp comment", match: :first

    assert_text "Kp comment was successfully destroyed"
  end
end
