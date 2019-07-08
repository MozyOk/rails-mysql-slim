require "application_system_test_case"

class RevenuesTest < ApplicationSystemTestCase
  setup do
    @revenue = revenues(:one)
  end

  test "visiting the index" do
    visit revenues_url
    assert_selector "h1", text: "Revenues"
  end

  test "creating a Revenue" do
    visit revenues_url
    click_on "New Revenue"

    click_on "Create Revenue"

    assert_text "Revenue was successfully created"
    click_on "Back"
  end

  test "updating a Revenue" do
    visit revenues_url
    click_on "Edit", match: :first

    click_on "Update Revenue"

    assert_text "Revenue was successfully updated"
    click_on "Back"
  end

  test "destroying a Revenue" do
    visit revenues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Revenue was successfully destroyed"
  end
end
