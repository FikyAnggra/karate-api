@Regression
@AuthGenerate
Feature: Auth Generate

  Background:
    * url 'https://dev-earn.honestmining.org/v2'

  Scenario Outline: : [<testType>] -> <testCase>
    Given header Authorization = 'Bearer <authorization>'
    And path '/auth/generate'
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"

    Examples:
      |testCase	                        |testType	|authorization	                        |status	|statusService	|statusNumber	|statusCode	|message                |
      |Success - Auth Generate	        |Positive	|d7e6f20a-b4c5-4b0b-8771-c059d3dced2e	|1	    |10	            |F010001	    |SSSSSS	    |Key Generated          |
      |Failed - Public Key Not Found	|Negative	|d7e6f20a-b4c5-4b0b-8771-c059d3dced2	|1	    |10	            |7010001	    |ARGXXX	    |Public Key Not Found   |
