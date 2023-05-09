@Regression
@EarnUserAsset
Feature: Earn User Asset

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
    And request body = {"coin_id" : <coinId>}
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"

    Examples:
      |testCase	                  |testType	|coinId	|status	|statusService	|statusNumber	|statusCode	|message        |
      |Success - Get Assets DAI	  |Positive	|911	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets UNI	  |Positive	|916	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets ETH	  |Positive	|907	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets DASH  |Positive	|3	    |1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets XZC   |Positive	|4	    |1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets ONE   |Positive	|864	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets USDC  |Positive	|914	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets USDT  |Positive	|913	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets VEX	  |Positive	|867	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets BNB	  |Positive	|920	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets BTC	  |Positive	|5	    |1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets ADA	  |Positive	|906	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets MATIC |Positive	|908	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets SOL	  |Positive	|921	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Success - Get Assets DOT	  |Positive	|922	|1	    |10	            |F000001	    |SSSSSS	    |Success        |
      |Failed - Coin Id Not Found |Negative	|123	|0	    |10	            |4000001	    |DNFXXX	    |Coin not found |
