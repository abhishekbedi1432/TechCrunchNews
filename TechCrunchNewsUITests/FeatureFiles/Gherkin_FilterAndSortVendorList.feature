Feature: Filter and Sort Vendor List

@FilterVendorList @VL @AdExFlows
Scenario: Verify applying filter under food vertical.

    Given I am on splash screen
    When I tap on optional Skip Ad button
    When I select choose location manually
    When I select country "UAE"
    When I allow app to use my location once if prompted
    When I tap cancel on location map if presented
    When I navigate back to home screen if i am on location map
    When I click on change location in home screen
    When I allow app to use my location once if prompted
    When I search for location "Business Bay"
    When I select first match for location in search results
    When I confirm pin location if prompted
    When I select vertical with tag "food"
    When I minimize gem if found
    When I select Filter
    When I filter by "Offers"
    When I apply filter
    Then vendor list should be filtered by "Offers" only
