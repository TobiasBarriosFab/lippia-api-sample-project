@Project
Feature: Project

  @GetAllProjectsOnWorkspace
  Scenario Outline:  Get all projects on workspace
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained


    Examples:
      | jsonName                | statusCode | operation | entity  | token                                            |
      | getAllProjectsWorkspace | 200        | GET       | PROJECT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |

  @addNewProject
  Scenario Outline:  Add a new project
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained

    Examples:
      | jsonName      | statusCode | operation | entity  | token                                            |
      | addNewProject | 201        | POST      | PROJECT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |

  @deleteProject
  Scenario Outline: Delete project from workspace
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    And I perform a 'POST' to 'PROJECT' endpoint with the 'addNewProject' and ''
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Examples:
      | jsonName      | statusCode | operation | entity  | token                                            |
      | deleteProject | 200        | DELETE    | PROJECT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |

  @findProject
  Scenario Outline: Find project by ID
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    And I perform a 'POST' to 'PROJECT' endpoint with the 'addNewProject' and ''
    And I perform a 'DELETE' to 'PROJECT' endpoint with the 'deleteProject' and ''
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    And obtengo un project id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Examples:
      | jsonName        | statusCode | operation | entity   | token                                            |
      | findProjectByID | 200        | GET       | PROJECTS | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |

  @updateProjectWorkspace
  Scenario Outline: Update project on workspace
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    And I perform a 'POST' to 'PROJECT' endpoint with the 'addNewProject' and ''
    And I perform a 'DELETE' to 'PROJECT' endpoint with the 'deleteProject' and ''
    And I perform a 'GET' to 'PROJECT' endpoint with the 'getAllProjectsWorkspace' and ''
    And obtengo un project id
    And I perform a 'GET' to 'PROJECTS' endpoint with the 'findProjectByID' and ''
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Examples:
      | jsonName               | statusCode | operation | entity   | token                                            |
      | updateProjectWorkspace | 200        | PUT       | PROJECTS | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |