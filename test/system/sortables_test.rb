require "application_system_test_case"

class SortablesTest < ApplicationSystemTestCase
  setup do
    @sortable = sortables(:one)
  end

  test "visiting the index" do
    visit sortables_url
    assert_selector "h1", text: "Sortables"
  end

  test "creating a Sortable" do
    visit sortables_url
    click_on "New Sortable"

    fill_in "Position", with: @sortable.position
    click_on "Create Sortable"

    assert_text "Sortable was successfully created"
    click_on "Back"
  end

  test "updating a Sortable" do
    visit sortables_url
    click_on "Edit", match: :first

    fill_in "Position", with: @sortable.position
    click_on "Update Sortable"

    assert_text "Sortable was successfully updated"
    click_on "Back"
  end

  test "destroying a Sortable" do
    visit sortables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sortable was successfully destroyed"
  end
end
