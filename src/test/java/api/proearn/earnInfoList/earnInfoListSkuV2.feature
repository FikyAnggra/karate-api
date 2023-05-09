@Regression
@EarnInfoListSku
Feature: Earn Info List Detail

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
    And param sku = "<sku>"
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"
    Then match response.data[0].sku == "<sku>"

    Examples:
      |testCase	                        |testType |sku  	        |status	|statusService	|statusNumber	|statusCode	|message                        |
      |Success - Get Earn Info DAI      |Positive |DAI-2            |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info UNI	    |Positive |UNI-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info ETH	    |Positive |ETH-3 	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info DASH	    |Positive |DASH-1 	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info XZC	    |Positive |XZC-1 	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info ONE	    |Positive |ONE-1 	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info USDC	    |Positive |NU-210113063444  |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info USDT	    |Positive |NU-210109094739	|1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info VEX	    |Positive |VEX-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info BNB	    |Positive |BNB-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info BTC	    |Positive |BTC-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info ADA	    |Positive |ADA-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info MATIC	|Positive |MATIC-1	        |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info SOL	    |Positive |SOL	            |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |
      |Success - Get Earn Info DOT	    |Positive |DOT	            |1	    |10	            |F001001	    |SSSSSS	    |Success get Coin List          |

