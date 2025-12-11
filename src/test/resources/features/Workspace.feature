@Workspace
Feature: workspace

  @GetAllMyWorkspace
  Scenario Outline: Get all my workspaces
    Given An account created in Clockify and x-api-key '<token>' generated
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained


    Examples:
      | jsonName        | statusCode | operation | entity    | token                                            |
      | getAllWorkspace | 200        | GET       | WORKSPACE | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |