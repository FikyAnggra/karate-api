@Regression
@EarnCalculator
Feature: Earn Calculator

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def token = auth.response.data.token
    * header x-signature = token
    * header z-lang = 'ID'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/earn/calculator/coins'
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"

    Examples:
      |testCase	                          |testType	|status	|statusService	|statusNumber	|statusCode	|message              |
      |Success - Get Calculator Coin	  |Positive	|1	    |10	            |F000001	    |SSSSSS	    |Success              |
