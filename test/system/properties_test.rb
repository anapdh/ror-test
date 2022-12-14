require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Name", with: @property.name
    fill_in "Plant specie", with: @property.plant_specie
    fill_in "Plantation area", with: @property.plantation_area
    fill_in "Plants column spacing", with: @property.plants_column_spacing
    fill_in "Plants number", with: @property.plants_number
    fill_in "Plants row spacing", with: @property.plants_row_spacing
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Name", with: @property.name
    fill_in "Plant specie", with: @property.plant_specie
    fill_in "Plantation area", with: @property.plantation_area
    fill_in "Plants column spacing", with: @property.plants_column_spacing
    fill_in "Plants number", with: @property.plants_number
    fill_in "Plants row spacing", with: @property.plants_row_spacing
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
