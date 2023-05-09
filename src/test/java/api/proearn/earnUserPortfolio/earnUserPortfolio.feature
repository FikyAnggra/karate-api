@Regression
@EarnUserPortfolio
Feature: Earn User Portfolio

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def token = auth.response.data.token
    * header x-signature = token
    * header z-userid = '20841'
    * header z-lang = 'ID'
    * header z-currency = 'IDR'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/earn/user/asset'
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"
    Then match response.data.label == "Total Earn Balance"
    Then match response.data.value == "#present"

    Examples:
      |testCase	                    |testType	|status	|statusService	|statusNumber	|statusCode	|message     |
      |Success - Get User Portfolio	|Positive	|1	    |10	            |F000001	    |SSSSSS	    |Success     |
