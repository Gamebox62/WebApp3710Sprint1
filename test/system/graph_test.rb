require "application_system_test_case"

class GraphTest < ApplicationSystemTestCase
  setup do
    @stat = stats(:one) # Assuming a stat fixture is available for the test
  end

  test "should display graph on the stats index page" do
    visit stats_url

    # Verify that the <canvas> element for the graph is present
    assert_selector "canvas#solutionsChart"

    # Verify that the correct data attributes are in place for the graph
    canvas = find("canvas#solutionsChart")
    assert_equal @stat.solution.to_json, canvas[:'data-solutions']
    assert_equal @stat.title.to_json, canvas[:'data-labels']

    # Optionally, you can also check if the graph data appears visually (e.g., using JavaScript)
    # but this can be harder to test as it requires interacting with the JavaScript rendering.
  end
end