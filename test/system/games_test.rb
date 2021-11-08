require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "get a message when the word is not in the grid" do
    visit new_url
    fill_in "word", with: "TESTINGCASE"
    click_on "Play"

    assert_text "Sorry but TESTINGCASE can't be built out of"
  end


  test "Inputing one-letter consonant word will return a message that the word is not a valid English word" do
    visit new_url
    page.execute_script("document.getElementById('letters').value = 'Q W Q W Q W Q W Q W'")
    fill_in "word", with: "QW"
    click_on "Play"

    assert_text "Sorry but QW does not seem to be a valid English word..."
  end

  test "gets Congratulations when the word is a valid word and characters are from the grid" do
    visit new_url
    page.execute_script("document.getElementById('letters').value = 'C H A R A C T E R S'")
    fill_in "word", with: "characters"
    click_on "Play"

    assert_text "Congratulations!"
  end
end
