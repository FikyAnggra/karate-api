@Regression
@EarnInfoList
Feature: Earn Info List

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def token = auth.response.data.token
    * header x-signature = token
    * header z-userid = '20841'
    * header z-lang = 'ID'
    * header z-currency = 'IDR'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/earn/info'
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"

    Examples:
      |testCase	                          |testType	|status	|statusService	|statusNumber	|statusCode	|message                |
      |Success - Get Coin List Info 	  |Positive	|1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List  |
