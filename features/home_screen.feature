@home_screen
Feature: Test for Home screen functionality

  @default
  Scenario: Default value on Home screen is Foot and Centimeter
    Given I land on home screen
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"

  Scenario: Show All button should be enabled at launch
    Given I land on home screen
    Then Show All button should be enabled
    When I press Clear button
    Then Show All button should be disabled
    Then Show All button should be enabled

  @conversions
  Scenario Outline: Verify default conversion
    Given I land on home screen
    When I type "<target>" to target text field
    Then I should see result as "<result>"
    Examples:
      | target | result |
      | 1      | 12     |
      | 2      | 24     |
      | 3      | 36     |
      | 9      | 106    |

  Scenario: User able to add current conversion to favorites list
    Given I land on home screen
    Then I press Add to Favorites icon
    When I press on Menu icon
    Then I press on Favorite conversions
    And I verify "Length" added to Favorite conversions list

  Scenario: User able to search by existing Conversion type
    Given I land on home screen
    Then I press on search icon
    Then I type "Temperature" in search field
    And I press return button on soft keyboard
    Then I see "Temperature" as a current unit converter
    Then Left Unit picker value should be "Celsius"
    And Right Unit picker value should be "Fahrenheit"