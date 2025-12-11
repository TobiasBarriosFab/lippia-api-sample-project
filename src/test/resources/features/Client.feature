@Client
Feature: client

  @AddNewClient
  Scenario Outline: Add a new client
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Examples:
      | jsonName     | statusCode | operation | entity | token                                            |
      | addNewClient | 201        | POST      | CLIENT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 |

  @FindClientsWorkspace
  Scenario Outline: Find clients on workspace
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'POST' to '<entity>' endpoint with the 'addNewClient' and ''
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    And tengo un cliente con el nombre <nameClient>
    Examples:
      | jsonName             | statusCode | operation | entity | token                                            | nameClient |
      | findClientsWorkspace | 200        | GET       | CLIENT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 | Client X   |

  @DeleteClientWorkspace
  Scenario Outline: Find clients on workspace
    Given An account created in Clockify and x-api-key '<token>' generated
    And I perform a 'GET' to 'WORKSPACE' endpoint with the 'getAllWorkspace' and ''
    And Obtengo un workspace id
    And I perform a 'POST' to '<entity>' endpoint with the 'addNewClient' and ''
    And I perform a 'GET' to '<entity>' endpoint with the 'findClientsWorkspace' and ''
    And tengo un cliente con el nombre <nameClient>
    And obtengo un client id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then status code <statusCode> is obtained
    Examples:
      | jsonName     | statusCode | operation | entity | token                                            | nameClient |
      | deleteClient | 200        | DELETE    | CLIENT | N2RjNzBiNDYtNWQ3OS00MzJlLTgyOTUtMGE5MWZiNzFhMzI5 | Client X   |