require "application_system_test_case"

class InterventionsTest < ApplicationSystemTestCase
  setup do
    @intervention = interventions(:one)
  end

  test "visiting the index" do
    visit interventions_url
    assert_selector "h1", text: "Interventions"
  end

  test "creating a Intervention" do
    visit interventions_url
    click_on "New Intervention"

    fill_in "Author", with: @intervention.author
    fill_in "Batteryid", with: @intervention.batteryid
    fill_in "Buildingid", with: @intervention.buildingid
    fill_in "Columnid", with: @intervention.columnid
    fill_in "Customerid", with: @intervention.customerid
    fill_in "Elevatorid", with: @intervention.elevatorid
    fill_in "Employeeid", with: @intervention.employeeid
    fill_in "Enddate", with: @intervention.enddate
    fill_in "Report", with: @intervention.report
    fill_in "Result", with: @intervention.result
    fill_in "Startdate", with: @intervention.startdate
    fill_in "Status", with: @intervention.status
    click_on "Create Intervention"

    assert_text "Intervention was successfully created"
    click_on "Back"
  end

  test "updating a Intervention" do
    visit interventions_url
    click_on "Edit", match: :first

    fill_in "Author", with: @intervention.author
    fill_in "Batteryid", with: @intervention.batteryid
    fill_in "Buildingid", with: @intervention.buildingid
    fill_in "Columnid", with: @intervention.columnid
    fill_in "Customerid", with: @intervention.customerid
    fill_in "Elevatorid", with: @intervention.elevatorid
    fill_in "Employeeid", with: @intervention.employeeid
    fill_in "Enddate", with: @intervention.enddate
    fill_in "Report", with: @intervention.report
    fill_in "Result", with: @intervention.result
    fill_in "Startdate", with: @intervention.startdate
    fill_in "Status", with: @intervention.status
    click_on "Update Intervention"

    assert_text "Intervention was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention" do
    visit interventions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention was successfully destroyed"
  end
end
