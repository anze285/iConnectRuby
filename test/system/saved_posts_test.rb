require "application_system_test_case"

class SavedPostsTest < ApplicationSystemTestCase
  setup do
    @saved_post = saved_posts(:one)
  end

  test "visiting the index" do
    visit saved_posts_url
    assert_selector "h1", text: "Saved Posts"
  end

  test "creating a Saved post" do
    visit saved_posts_url
    click_on "New Saved Post"

    click_on "Create Saved post"

    assert_text "Saved post was successfully created"
    click_on "Back"
  end

  test "updating a Saved post" do
    visit saved_posts_url
    click_on "Edit", match: :first

    click_on "Update Saved post"

    assert_text "Saved post was successfully updated"
    click_on "Back"
  end

  test "destroying a Saved post" do
    visit saved_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saved post was successfully destroyed"
  end
end
