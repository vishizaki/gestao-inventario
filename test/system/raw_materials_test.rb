require "application_system_test_case"

class RawMaterialsTest < ApplicationSystemTestCase
  setup do
    @raw_material = raw_materials(:one)
  end

  test "visiting the index" do
    visit raw_materials_url
    assert_selector "h1", text: "Raw Materials"
  end

  test "creating a Raw material" do
    visit raw_materials_url
    click_on "New Raw Material"

    fill_in "Log", with: @raw_material.log
    fill_in "Name", with: @raw_material.name
    fill_in "Quantity", with: @raw_material.quantity
    click_on "Create Raw material"

    assert_text "Raw material was successfully created"
    click_on "Back"
  end

  test "updating a Raw material" do
    visit raw_materials_url
    click_on "Edit", match: :first

    fill_in "Log", with: @raw_material.log
    fill_in "Name", with: @raw_material.name
    fill_in "Quantity", with: @raw_material.quantity
    click_on "Update Raw material"

    assert_text "Raw material was successfully updated"
    click_on "Back"
  end

  test "destroying a Raw material" do
    visit raw_materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Raw material was successfully destroyed"
  end
end
