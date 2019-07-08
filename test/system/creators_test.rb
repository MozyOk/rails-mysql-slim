require "application_system_test_case"

class CreatorsTest < ApplicationSystemTestCase
  setup do
    @creator = creators(:one)
  end

  test "visiting the index" do
    visit creators_url
    assert_selector "h1", text: "Creators"
  end

  test "creating a Creator" do
    visit creators_url
    click_on "New Creator"

    click_on "Create Creator"

    assert_text "Creator was successfully created"
    click_on "Back"
  end

  test "updating a Creator" do
    visit creators_url
    click_on "Edit", match: :first

    click_on "Update Creator"

    assert_text "Creator was successfully updated"
    click_on "Back"
  end

  test "destroying a Creator" do
    visit creators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Creator was successfully destroyed"
  end
end
