require "application_system_test_case"

class StatsTest < ApplicationSystemTestCase
  setup do
    @stat = stats(:one)
  end

  test "visiting the index" do
    visit stats_url
    assert_selector "h1", text: "Stats"
  end

  test "should create stat" do
    visit stats_url
    click_on "New stat"

    fill_in "Admin", with: @stat.admin_id
    fill_in "Description", with: @stat.description
    fill_in "Solution", with: @stat.solution
    fill_in "Title", with: @stat.title
    click_on "Create Stat"

    assert_text "Stat was successfully created"
    click_on "Back"
  end

  test "should not create stat with invalid data" do
    visit stats_url
    click_on "New stat"

    # Try creating a stat without filling in the required fields
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_on "Create Stat"

    # Expect validation error message
    assert_text "Title can't be blank"
    assert_text "Description can't be blank"
  end

  test "should update stat" do
    visit stat_url(@stat)
    click_on "Edit this stat", match: :first

    fill_in "Admin", with: @stat.admin_id
    fill_in "Description", with: @stat.description
    fill_in "Solution", with: @stat.solution
    fill_in "Title", with: @stat.title
    click_on "Update Stat"

    assert_text "Stat was successfully updated"
    click_on "Back"
  end

  test "should not update stat with invalid data" do
    visit stat_url(@stat)
    click_on "Edit this stat", match: :first

    # Try updating with invalid data
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_on "Update Stat"

    # Expect validation error message
    assert_text "Title can't be blank"
    assert_text "Description can't be blank"
  end

  test "should destroy stat" do
    visit stat_url(@stat)
    click_on "Destroy this stat", match: :first

    assert_text "Stat was successfully destroyed"
  end

  test "should show stat details" do
    visit stat_url(@stat)

    # Check that the stat details are correctly displayed
    assert_selector "h1", text: @stat.title
    assert_text @stat.description
    assert_text @stat.solution
    assert_text "Admin: #{@stat.admin_id}"
  end

  test "should list all stats on index page" do
    visit stats_url

    # Ensure that the stats list is visible
    assert_selector "h1", text: "Stats"
    assert_text @stat.title

    # Check if there are other stats, if applicable
    stats = Stat.all
    stats.each do |stat|
      assert_text stat.title
    end
  end
end