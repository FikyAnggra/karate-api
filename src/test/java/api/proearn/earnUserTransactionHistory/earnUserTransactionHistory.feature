@Regression
@EarnUserTransactionHistory
Feature: Earn User Transaction History

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def token = auth.response.data.token
    * header x-signature = token
    * header z-userid = '20841'
    * header z-lang = 'ID'
    * header z-currency = 'IDR'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/earn/user/history'
    And request body = {"sku" : "<sku>"}
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"

    Examples:
      |testCase	                                    |testType	|sku	        |status	        |statusService	|statusNumber	|statusCode	|message        |
      |Success - Get user transaction history DAI	|Positive	|DAI-2	        |1	            |10             |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history ETH	|Positive	|ETH-3	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history DASH	|Positive	|DASH-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history ONE	|Positive	|ONE-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history USDC	|Positive	|NU-210113063444|1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history USDT	|Positive	|NU-210109094739|1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history VEX	|Positive	|VEX-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history UNI	|Positive	|UNI-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history XZC	|Positive	|XZC-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history BNB	|Positive	|BNB-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history BTC	|Positive	|BTC-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history ADA	|Positive	|ADA-1	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history MATIC	|Positive	|MATIC-1	    |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history SOL	|Positive	|SOL	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Success - Get user transaction history DOT	|Positive	|DOT	        |1	            |10	            |F001001	    |SSSSSS	    |Success        |
      |Failed - SKU Not Found	                    |Negative	|ABC-1	        |0	            |10	            |4001001	    |DNFXXX	    |Sku not found  |
