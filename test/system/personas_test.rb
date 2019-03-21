require "application_system_test_case"

class PersonasTest < ApplicationSystemTestCase
  setup do
    @persona = personas(:one)
  end

  test "visiting the index" do
    visit personas_url
    assert_selector "h1", text: "Personas"
  end

  test "creating a Persona" do
    visit personas_url
    click_on "New Persona"

    fill_in "Birth year", with: @persona.birth_year
    fill_in "Eye color", with: @persona.eye_color
    fill_in "Films", with: @persona.films
    fill_in "Gender", with: @persona.gender
    fill_in "Hair color", with: @persona.hair_color
    fill_in "Height", with: @persona.height
    fill_in "Homeworld", with: @persona.homeworld
    fill_in "Mass", with: @persona.mass
    fill_in "Name", with: @persona.name
    fill_in "Skin color", with: @persona.skin_color
    click_on "Create Persona"

    assert_text "Persona was successfully created"
    click_on "Back"
  end

  test "updating a Persona" do
    visit personas_url
    click_on "Edit", match: :first

    fill_in "Birth year", with: @persona.birth_year
    fill_in "Eye color", with: @persona.eye_color
    fill_in "Films", with: @persona.films
    fill_in "Gender", with: @persona.gender
    fill_in "Hair color", with: @persona.hair_color
    fill_in "Height", with: @persona.height
    fill_in "Homeworld", with: @persona.homeworld
    fill_in "Mass", with: @persona.mass
    fill_in "Name", with: @persona.name
    fill_in "Skin color", with: @persona.skin_color
    click_on "Update Persona"

    assert_text "Persona was successfully updated"
    click_on "Back"
  end

  test "destroying a Persona" do
    visit personas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Persona was successfully destroyed"
  end
end
